class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  #use metaprogramming to assign the newly created student attributes
  #and values in accordance with the key/value pairs of the hash
  #Use the #send method to acheive this.
  #This method should also add the newly created student to the Student class' @@all array of all students.
  def initialize(student_hash)
    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  ##create_from_collection method should iterate over the array
  #of hashes and create a new individual student using each hash.
  def self.create_from_collection(students_array)
    students_array.each {|student_hash| Student.new(student_hash)}
  end

  def add_student_attributes(attributes_hash)

  end

  def self.all

  end
end
