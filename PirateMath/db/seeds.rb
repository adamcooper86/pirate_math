(0..12).each do |number_one|
  (0..12).each do |number_two|
    Fact.create number_1: number_one, number_2: number_two, solution: (number_one + number_two), operation: "+"
  end
end
