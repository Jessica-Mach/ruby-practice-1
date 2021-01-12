require "prawn"

#Generate Bingo numbers to column arrays
b_col = (1..15).to_a.sample(5)
i_col = (16..30).to_a.sample(5)
n_col = (31..45).to_a.sample(5)
g_col = (46..60).to_a.sample(5)
o_col = (61..75).to_a.sample(5)

#Determine if an additional space is needed for single digit numbers
def space_needed(bingo_num)
	if (bingo_num < 10)
		return " " + bingo_num.to_s
	else
		return bingo_num
	end
end

#Generate Bingo card
bingo_card = <<-BINGO
+-----+-----+-----+-----+-----+
|  B  |  I  |  N  |  G  |  O  |
+-----+-----+-----+-----+-----+
|  #{space_needed(b_col[0])} |  #{i_col[0]} |  #{n_col[0]} |  #{g_col[0]} |  #{o_col[0]} |
+-----+-----+-----+-----+-----+
|  #{space_needed(b_col[1])} |  #{i_col[1]} |  #{n_col[1]} |  #{g_col[1]} |  #{o_col[1]} |
+-----+-----+-----+-----+-----+
|  #{space_needed(b_col[2])} |  #{i_col[2]} |  F  |  #{g_col[2]} |  #{o_col[2]} |
+-----+-----+-----+-----+-----+
|  #{space_needed(b_col[3])} |  #{i_col[3]} |  #{n_col[3]} |  #{g_col[3]} |  #{o_col[3]} |
+-----+-----+-----+-----+-----+
|  #{space_needed(b_col[4])} |  #{i_col[4]} |  #{n_col[4]} |  #{g_col[4]} |  #{o_col[4]} |
+-----+-----+-----+-----+-----+
BINGO

puts bingo_card

Prawn::Document.generate("bingo.pdf") do
	define_grid(columns: 5, rows: 6)
	grid.show_all
end
