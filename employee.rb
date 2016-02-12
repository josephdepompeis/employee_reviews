class Employee
attr_reader :name, :email, :phone
attr_accessor :salary
  def initialize(name, email, phone, salary = 0)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
    @satisfactory = false
  end

def review
  @review
end

def satisfactory
  @satisfactory
end

def add_review(review_text)
  @review << review_text
end

def mark_satisfactory(yes_or_no)
@satisfactory = true if yes_or_no == true
end

def give_raise(amount)
@salary += amount

end

end
