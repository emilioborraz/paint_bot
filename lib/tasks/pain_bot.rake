require "#{Rails.root}/app/helpers/pain_bot_helper"
include PainBotHelper

namespace :pain_bot do
	task :play, [:grid_size] => :environment do |task, args|

		p ":: Controls ::"
		p "  |w|"
		p "|a|s|d|"
		p "-------"
		p "Press h to display historical data"
		p "Press e to exit"

		size = validGridSize?(args.grid_size) ? args.grid_size.to_i : defaultGridSize
		grid = initGrid(size)
		position = [0,0]
		moves = 0
		moveBot(grid, position, position)
		run_guid = SecureRandom.uuid

		while true do
			printGrid(grid)
			p "next move and press enter"
			keystroke = STDIN.gets.chomp

			case keystroke.downcase
			when 'w', 'a', 'd', 's'
				new_position = calculateNewPosition(position, keystroke.downcase)
				if validMove?(grid, new_position)
					moves += 1 
					recordMove(position, new_position, run_guid)
				end
				position = moveBot(grid, position, new_position)
			when 'h'
				p ':: Historical data ::'
				historicalData(run_guid).each do |key, value|
					puts "#{key}: #{value}"
				end
				p ':::: ::::'
			when 'e'
				p "Total number of moves #{moves}"
				p "bye bye"
				break
			else
				p 'wrong input'
			end
		end
		Kernel#exit!
	end

	def calculateNewPosition(position, keystroke)
		puts "#{position}"
		case keystroke
		when 'w'
			[position[0]-1, position[1]]
		when 'a'
			[position[0], position[1]-1]
		when 'd'
			[position[0], position[1]+1]
		when 's'
			[position[0]+1, position[1]]
		end
	end
end
