
def valid_name?(name)
    name =~ /^[A-Za-z\s]+$/
end
def valid_mobile_number?(mobile)
    mobile =~ /^\d{10}$/
end 
 def valid_email?(email)
    email =~ /^[A-Za-z0-9+_.-]+@(.+)$/
end 
def valid_edu?(edu)
    !edu.empty?
 end 
 def valid_age?(age)
    age  =~ /^\d{2}$/ && !age.empty?
end 
 def valid_branch?(branch)
    !branch.empty?
end 
def vaild_experience?(exp)
    exp.to_i >=0 && !exp.empty?
end 
def valid_technologies?(technology)
    !technology.empty?
end 

   available_technologies = [
    "Java",
    "Python",
    "JavaScript",
    "Ruby",
    "C++",
    "Swift",
    "PHP",
    "Other"
  ]

  





File.open("Resume.txt","w+") do |f|
    f.write( "<------------------RESUME--------------------->" )
    f.write(" \n")
    # NAME
    loop do 
    puts "Enter your name"
        name = gets.chomp
        if valid_name?(name)
            f.write("Name : #{name} \n")
            break 
        else 
            puts "Invalid name. Please write a Valid Name"
        end
    end  
    
    # AGE
    loop do 
        puts "Enter your Age"
        age  = gets.chomp
        if valid_age?(age)
            f.write("Age : #{age}\n")
            break 
        else 
            puts "Please enter your Age and cannot be empty."
        end 
    end 
    
    #Contact Number
    loop do 
        puts "Enter your mobile no"
        mobile = gets.chomp
        if valid_mobile_number?(mobile)
            f.write("Contact No : #{mobile} \n")
            break
        else 
            puts "Write a 10 digit contact number and cannot be empty "
        end 
    end 
     
    #E-mail
    loop do 
        puts "Enter your Email Id"
        email = gets.chomp
        if valid_email?(email)
            f.write("E-mail : #{email} \n")
            break 
        else 
            puts "Invalid email address. Please enter a valid email."
        end   
    end 

    # Education 
    loop do 
        puts "Enter your Education"
        edu = gets.chomp
        if valid_edu?(edu)
            f.write("Education : #{edu}\n ")
            break 
        else 
            puts "Education cannot be empty. Please enter your education."
        end 
    end 

    # Branch 
    loop do 
        puts "Enter your Branch"
        branch = gets.chomp
        if valid_branch?(branch)
            f.write("Branch : #{branch} \n")
            break 
        else 
            puts "Branch cannot be empty . Please enter your education "
        end 
    end     
    # Experience
    loop do 
        puts "Enter your Experience"
        exp = gets.chomp 
        if vaild_experience?(exp)
            f.write("Experience : #{exp} \n")
            break 
        else 
            puts "Experience cannot be nil or negative "
        end 
    end 
        
        # Techonology 
        selected_technologies =[]
        puts "Select your preferred technologies : "
        available_technologies.each_with_index do |a, b|
            puts "#{b + 1}. #{a}" 
        end 

        print "Enter the numbers corresponding to your selected technologies: "
        tech_selected = gets.chomp.split.map(&:to_i)
        tech_selected.each do |num|
            if num >= 1 && num <= available_technologies.length 
                selected_technologies << available_technologies[num -1]
            else 
                puts "Invalid technology number #{num}. Please select a valid number."
            end 
        end 

        if valid_technologies?(selected_technologies)
            f.write("Technologies : #{selected_technologies.join(', ')}")
        else 
            puts "Please select atleast one tecnology"
        end 

end

require 'prawn'

pdf_file_name = 'Resume.pdf'


resume_content = File.read('Resume.txt')

Prawn::Document.generate(pdf_file_name) do
  text resume_content
end

puts "PDF saved as #{pdf_file_name}"


