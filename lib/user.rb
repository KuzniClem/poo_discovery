# frozen_string_literal: true

class User
  attr_accessor(:email, :name)
  @@user_list = []

  def initialize(email_to_save)
    if check_email(email_to_save)
      @email = email_to_save
      @@user_list << self
    else
      puts "ERREUR ! EMAIL FOIREUX. Recommence"
    end
  end

  def email
    @email
  end

  def self.all
  	@@user_list
  end

  def self.find_by_email(email_to_find)
    @@user_list.at(@@user_list.map(&:email).index(email_to_find))
  end

  def check_email(email_to_save)
  	!email_to_save.empty?
  end
end
