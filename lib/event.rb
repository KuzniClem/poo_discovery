# frozen_string_literal: true

require 'time'

class Event

	attr_accessor(:start_date, :length, :title, :attendees)

	def initialize(start_date, length, title, attendees)
		@start_date = Time.parse(start_date)
		@length = length
		@title = title
		@attendees = attendees.map { |e| e.email }
	end

	def postpone_24h
		@start_date += 60 * 60 * 24
	end

	def end_date
		@start_date + @length * 60		
	end

	def is_past
		Time.now > @start_date
	end

	def is_future
		!self.is_past
	end

	def is_soon
		Time.now > (@start_date + 30 * 60)
	end

	def date_display
		@start_date.to_s.split.reverse.drop(1).reverse.join(' ')
	end

  def attendees_to_s
  	!!@attendees ? @attendees.join(', ') : ''
  end

	def to_s
		p "Titre : #{@title}"
		p "Date de début : #{date_display}"
		p "Durée : #{@length} minutes"
		p "Invités : #{attendees_to_s}"
	end
end
