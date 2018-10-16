def ispis(board)
	i=1
	board.each do |slot|
		print "[ "

		if slot[:state]
			print "#{slot[:state]}"
		else
			print "#{slot[:slot]}"
		end

		print " ]"
		if i%3==0
			print "\n"
		end
		i=i+1
	end
end


flag_counter=true
board=[]

i=0
9. times do
 board<<{
 	slot: i,
 	state: nil
 }
 i=i+1
end

puts "WELCOME TO THE GAME OF TIC-TAC-TOE\n"

while true do
	ispis(board)
	if flag_counter
		puts 'Player \'O\' move.'
		print 'Where do you want to a circle [0-8]?: '
		move=gets.chomp.to_i

		if move<0 || move>8
			puts "Input out or range, try again!"
			next
		end

		if (board[move][:state])
			puts "Field is not empty, try again!"
		else
			board[move][:state]='O'
			puts "Set circle to field #{move}"
			flag_counter=!flag_counter
		end
	else
		puts 'Player \'X\' move.'
		print 'Where do you want to a cross [0-8]?: '
		move=gets.chomp.to_i

		if move<0 || move>8
			puts "Input out or range, try again!"
			next
		end

		if (board[move][:state])
			puts "Field is not empty, try again!"
		else
			board[move][:state]='X'
			puts "Set cross to field #{move}"
			flag_counter=!flag_counter
		end
	end

end

		 









