require 'csv'

def read_dinosaurs(files)
  dinosaurs = {}

  files.each do |file_path|
    csv = CSV.read(file_path)

    (1...csv.length).each do |row|
      name = csv[row][0]

      (1...csv[row].length).each do |col|
        stat = csv[0][col]

        if dinosaurs[name]
          dinosaurs[name][stat] = csv[row][col]
        else
          dinosaurs[name] = {
            stat => csv[row][col],
            csv[0][0] => name
          }
        end
      end
    end
  end

  dinosaurs
end

def calculate_speed(leg_length, stride_length)
  gravity = 9.8
  ((stride_length / leg_length) - 1) * Math.sqrt(leg_length * gravity)
end

dinos = read_dinosaurs(['dataset1.csv', 'dataset2.csv'])

# Grab dinos that have the valid data
valid_dinos = dinos.select do |_, dino|
  dino['STANCE'] == 'bipedal' && dino['LEG_LENGTH'] && dino['STRIDE_LENGTH']
end

# Calculate the speed of the valid dinos
valid_dinos.values.each do |dino|
  dino['SPEED'] = calculate_speed(dino['LEG_LENGTH'].to_f, dino['STRIDE_LENGTH'].to_f)
end

# Sort the valid dino's by speed in desc order
sorted_dinos = bipedal_dinos.values.sort_by { |dino| -dino['SPEED'] }

# Print the dinos
sorted_dinos.each { |dino| puts "#{dino['NAME']}: #{dino['SPEED']}" }
