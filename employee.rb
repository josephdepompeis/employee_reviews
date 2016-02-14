class Employee
  attr_reader :name, :email, :phone
  attr_accessor :salary, :satisfactory
  def initialize(name:, email:, phone:, salary:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
    @review_file = ""
    @satisfactory = false
  end

  def review
    @review
  end

  def review_file
    @review_file
  end

  def satisfactory
    @satisfactory
  end

  def give_raise(amount)
    @salary += amount
  end

  def add_review(review_text)
    @review << review_text
  end

  def mark_satisfactory(yes_or_no)
    @satisfactory = true if yes_or_no == true
  end

  def add_review_file(review_text)
    contents = File.read(review_text)
    @review_file << contents
end



  #   @review << review_text
  # end
  # reviews = ['sample_review.txt']
  # # reviews = ['sample_review.txt', 'your_file_here.txt']

end
