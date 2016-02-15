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

  def add_review_file_updated(review_text)
    contents = File.open(review_text)
    review1 = []
    review2 = []
    review3 = []
    review4 = []
    counter = 0
    contents.each_line do |s|
      if s.to_s.include?("name-") && counter == 0
        review1 << s
        counter += 1
      elsif counter == 1
        review1 << s
        counter += 1
      elsif counter == 2
        review1 << s
        counter += 1
      elsif counter == 3
        review1 << s
        counter += 1
      elsif counter == 4
        review1 << s
        counter += 1
      elsif s.to_s.include?("name-") && counter == 5
        review2 << s
        counter +=1
      elsif counter == 6
        review2 << s
        counter += 1
      elsif counter == 7
        review2 << s
        counter += 1
      elsif counter == 8
        review2 << s
        counter += 1
      elsif counter == 9
        review2 << s
        counter += 1
      elsif s.to_s.include?("name-") && counter == 10
        review3 << s
        counter += 1
      elsif  counter == 11
        review3 << s
        counter += 1
      elsif counter == 12
        review3 << s
        counter += 1
      elsif counter == 13
        review3 << s
        counter += 1
      elsif counter == 14
        review3 << s
        counter += 1
      elsif s.to_s.include?("name-") && counter == 15
        review4 << s
        counter += 1
      elsif counter == 16
        review4 << s
        counter +=1
      elsif counter == 17
        review4 << s
        counter += 1
      elsif counter == 18
        review4 << s
        counter += 1
      else
        puts "does not compute"
      end
    end
      review1.each {|s| @review << review4.to_s if s.to_s.include?("#{@name}")}
      review2.each {|s| @review << review4.to_s if s.to_s.include?("#{@name}")}
      review3.each {|s| @review << review4.to_s if s.to_s.include?("#{@name}")}
      review4.each {|s| @review << review4.to_s if s.to_s.include?("#{@name}")}
  end

  def scan_review_file
    positive_terms = []
    negative_terms = []
    @review_file.scan(Regexp.union(/good/, /\Wsatisfactory/, /positive/, /hard/, /hard.work/, /swell/)).each do |match|
      positive_terms << match
      end
    @review_file.scan(Regexp.union(/bad/, /unsatisfactory/, /late/, /slow/)).each do |match|
      negative_terms << match
      end
    @satisfactory = true if positive_terms.length > negative_terms.length
  end
end
