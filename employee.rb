class Employee
attr_reader :name, :email, :phone
attr_accessor :salary
  def initialize(name, email, phone, salary = 0)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
  end

def review
  @review
end

def add_review(review_text)
  @review << review_text
end


end
