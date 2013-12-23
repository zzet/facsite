FactoryGirl.define do
  sequence :order do |n|
    n
  end

  sequence :string do |n|
    "string#{n}"
  end

  sequence :description, aliases: [:history] do |n|
    "description#{n}"
  end

  sequence :slug do |n|
    "slug#{n}"
  end

  sequence :name, aliases: [:title] do |n|
    "name#{n}"
  end

  sequence :body do |n|
    "body#{n}"
  end

  sequence :integer do |n|
    n
  end

  sequence :first_name, aliases: [:last_name] do |n|
    "Persona#{n}"
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :phone do |n|
    "+7#{n % 10}"
  end

  sequence :url do |n|
    "http://site#{n}.ru"
  end
end
