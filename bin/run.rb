require_relative '../config/environment'





def begin_game
##Setup Turn Clock
turn = GameEvent.gameclock

## BUILD MENUS HERE
main_menu_ui = UI.new("main_menu_ui")
main_menu_ui.menu_items =["[1] - Create a Dragon", "[2] - View Dragons", "[3] - Check Human Population", "   [4] - Create a Raid"]
main_menu_ui.header = "                     Dragon Maker - Turn # #{turn}"
main_menu_ui.body = "           Number of Dragons:".blue
main_menu_ui.has_border = true
main_menu_ui.has_divider = true
main_menu_ui.border_type = "dash-lg"
main_menu_ui.parent_menu = main_menu_ui
#1 create_dragon method creates this menu

#2
view_dragons_ui = UI.new("view_dragons_ui")
view_dragons_ui.menu_items = ["[back] to go back", ""]
view_dragons_ui.header = "                          YOUR DRAGONS".blue
view_dragons_ui.body = "\n   No dragons have been created...\n".blue
view_dragons_ui.has_border =  true
view_dragons_ui.border_type = "squiggles-md"
view_dragons_ui.has_divider = true
view_dragons_ui.parent_menu = main_menu_ui

#3
view_humans_ui = UI.new("view_humans_ui")
view_humans_ui.menu_items = ["[back] to go back", ""]
view_humans_ui.header = "                          HUMANS".blue
view_humans_ui.body = "\n   No humans exist...\n".blue
view_humans_ui.has_border =  true
view_humans_ui.border_type = "squiggles-md"
view_humans_ui.has_divider = true
view_humans_ui.parent_menu = main_menu_ui

#4
create_raid_ui = UI.new("create_raid_ui")
create_raid_ui.menu_items = ["[1] Test Dragon 1.", "[2] Test Dragon 2.","[3] Test Dragon 3.","[4] Test Dragon 4.","[5] Test Dragon 5.","[6] Test Dragon 6.",]
create_raid_ui.header = "                          CREATE RAID"
create_raid_ui.body = "\n   You have not created any dragons.\n".blue
create_raid_ui.has_border =  true
create_raid_ui.border_type = "carrot-md"
create_raid_ui.has_divider = true
create_raid_ui.layout_type = "vertical"
create_raid_ui.parent_menu = main_menu_ui
create_raid_ui.question_prompt = "Choose dragons for your raid. "





## put this into UI
def make_choice(num_input, menu_object)
    #-1 from num input to get the element of the array
    menu_object.menu_items[num_input - 1] = menu_object.menu_items[num_input - 1].green
    ## also need to add this choice to the chosen dragons...
    menu_object.prompt
end

def clear_choices(menu_object)
    menu_object.menu_items.each do |item|
        item = item.black
    end
end

binding.pry


def update_menu_items(new_menu_items_array, menu_object)
    # this will take in all the dragons after they are added to 
    # an array and make them menu items.
    new_menu_items_array.each_with_index do |item, i|
        menu_object.menu_items[i] = "[#{i + 1}] #{item}"
    end
end
# call this as update_menu_items(dragons, create_raid_ui)


##CREATE LOGIC HERE
main_menu_ui.set_logic(method(:create_dragon), view_dragons_ui.method(:prompt), view_humans_ui.method(:prompt) , create_raid_ui.method(:prompt))

test = lambda {make_choice(1, create_raid_ui)}
test2 = lambda {make_choice(2, create_raid_ui)}
test3 = lambda {make_choice(3, create_raid_ui)}
test4 = lambda {make_choice(4, create_raid_ui)}
test5 = lambda {make_choice(5, create_raid_ui)}
test6 = lambda {make_choice(6, create_raid_ui)}
test7 = lambda {make_choice(7, create_raid_ui)}
test8 = lambda {make_choice(8, create_raid_ui)}
test9 = lambda {make_choice(9, create_raid_ui)}
create_raid_ui.set_logic(test, test2, test3, test4, test5, test6, test7, test8, test9)  

## make choice, once you make that choice that choice either turns green or turns black again.. also adds it to your chosen
## dragons that will be carried to the next part of the raid.



##SETUP GAME EVENTS HERE
GameEvent.new(nil, 40, "Testing")
GameEvent.new(nil, 50, "Testing")


## begin game  
system("clear")

UI.billboard("WELCOME TO DRAGON MAKER!")
UI.ask_for_enter

## MAIN GAME LOOP
i = 0
while i < 30
    ## REGENERATE MENUS
    turn = GameEvent.gameclock
    main_menu_ui.header = "                     Dragon Maker - Turn # #{turn}"  
    main_menu_ui.body = "           Number of Dragons:".blue
    ###############


    ## START TURN
    main_menu_ui.prompt


    ###calculate game

    ##RECAP TURN
    UI.blank_space(5)
    #UI.announce("Turn #{turn} is over! Let's see how you fared...")
    UI.blank_space(5)
    GameEvent.weeks_summary(turn) #function that puts out the weeks events
    UI.ask_for_enter
    UI.blank_space(5)


    ##INCREMENT GAME CLOCK AND MOVE TO NEXT WEEK
    GameEvent.increment_game_clock(1)
    i += 1
end
puts "Thanks for playing Dragon Maker!"
end

def create_dragon
    
    dragon_name = UI.simple_question("Name your dragon:")
    UI.blank_space(5)
    dragon_wingspan = UI.simple_question("What is your dragon's wingspan?")
    UI.blank_space(5)
    dragon_color = UI.simple_question("What color is your dragon?")
    UI.blank_space(5)
    dragon_pattern = UI.simple_question("What pattern is your dragon?")


    ## Dragon.create(name: dragon_name, wingspan: dragon_wingspan, color: dragon_color, pattern: dragon_pattern)
    ## create instance of boris here
    ## create game event here #will need a week 
    puts "#{dragon_name} has been created!"
end

begin_game