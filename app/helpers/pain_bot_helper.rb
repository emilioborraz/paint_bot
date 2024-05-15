module PainBotHelper
	def defaultGridSize
		10
	end

	def validGridSize?(size)
		return true if size != nil and size.to_i > 0
	end

	def initGrid(size)
		grid = size.times.map { [] }
		grid.map! do |row|
			size.times.map { " " }
		end
	end

	def moveBot(grid, position, new_position)
		return position unless validMove?(grid, new_position)

		grid[position[0]][position[1]] = "X"
		grid[new_position[0]][new_position[1]] = "☺️"
		
		new_position
	end

	def validMove?(grid, new_position)
		return false if (new_position[0] < 0 or new_position[0] >= grid.size)
		return false if (new_position[1] < 0 or new_position[1] >= grid.size)
		true
	end

	def printGrid(grid)
		grid.each do |row|
			puts "#{row}"
		end
	end

	def recordMove(position, new_position, guid)
		direction = getDirection(position, new_position)
		BotMove.create(direction: direction, guid: guid)
	end

	def getDirection(position, new_position)
		return "down" if position[0] < new_position[0]
		return "up" if position[0] > new_position[0]
		return "left" if position[1] > new_position[1]
		return "right" if position[1] < new_position[1]
	end

	def historicalData(guid)
		{
			"total_moves_all_time" => BotMove.count,
			"total_left_moves_all_time" => BotMove.where(direction: "left").count,
			"total_right_moves_all_time" => BotMove.where(direction: "right").count,
			"total_up_moves_all_time" => BotMove.where(direction: "up").count,
			"total_down_moves_all_time" => BotMove.where(direction: "down").count,
			"total_program_runs_with_moves_all_time" => BotMove.distinct.pluck(:guid).size,
			"total_left_moves_current_run" => BotMove.where(direction: "left", guid: guid).count,
			"total_right_moves_current_run" => BotMove.where(direction: "right", guid: guid).count,
			"total_up_moves_current_run" => BotMove.where(direction: "up", guid: guid).count,
			"total_down_moves_current_run" => BotMove.where(direction: "down", guid: guid).count,
		}
	end
end
