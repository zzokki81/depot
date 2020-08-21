require('test_helper')
class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test('product attributes must not be empty') do
    product = Product.new
    assert(product.invalid?)
    assert(product.errors[:title].any?)
    assert(product.errors[:description].any?)
    assert(product.errors[:price].any?)
    assert(product.errors[:image_url].any?)
  end

  test('product attributes must be positive') do
    product = Product.new(title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg')
    product.price = -1
    assert(product.invalid?)
    assert_equal(['must be greater then or equal to 0.01'], product.errors[:price])
    product.price = 0
    assert(product.invalid?)
    assert_equal(['must be greater then or equal to 0.01'], product.errors[:price])
    product.price = 1
    assert(product.valid?)
  end

  def new_product(image_url)
    Product.new(title: 'My Book Title', description: 'yyy', price: 1, image_url: image_url)
  end

  test('image url') do
    ok = ['fred.gif', 'fred.jpg', 'fred.png', 'FRED.JPG', 'FRED.Jpg', 'http://a.b.c/x/y/z/fred.gif']
    bad = ['fred.doc', 'fred.gif/more', 'fred.gif.more']
    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} shouldn't be invalid"
    end
    bad.each do |image_url|
    assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end

  test 'Product is not valid without a unique titile' do
product = Product.new(titile: product(:ruby).title, description: "yyy", price: 1, image_url: fred.jpg)
assert product.invalid?
assert_equal ["has allrady been taken"].product.errors[:title]
  end
end
