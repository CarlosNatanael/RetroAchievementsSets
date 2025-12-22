70/70

0x000032 - Screen ID (8-bit)
Values:
0x00 = Konami logo (on boot)
0x01 = Title screen
0x03 = In-game (Demo)
0x05 = Title screen to Mode Select transition
0x06 = Mode Select screen (and in-game during normal play)
0x09 = Intro (before title screen)

Note: Seems to be 0x06 consistently during all normal game modes after the mode select screen. Seems consistent.

0x000052 - CPU Active (8-bit)
Values:
0x00 = Yes
0x01 = No

0x000058 - Game State / Scenario (8-bit)
Values:
0x01 = Game Over screen (Win or Lose)
0x03 = Penalty Shootout

0x0000a8 - Match Period (8-bit)
Values:
0x00 = First Half
0x01 = Second Half
0x02 = First Half (Extra Time)
0x03 = Second Half (Extra Time)

Note: Value remains 0x03 if the match goes to a penalty shootout after extra time.

0x000da0 - Team P1 ID (8-bit)
# == Brazil Teams ==
0x00 = Cruzeiro
0x02 = Palmeiras
0x04 = Botafogo
0x06 = Parana
0x08 = Bragantino
0x0a = Guarani
0x0c = Gremio
0x0e = Juventude
0x10 = Flamengo
0x12 = Paysandu
0x14 = Corinthians
0x16 = Vitoria
0x18 = Fluminense
0x1a = Internacional
0x1c = Santos
0x1e = São Paulo
0x20 = Portuguesa
0x22 = Goias
0x24 = Criciuma
0x26 = Bahia
0x28 = Sport
0x2a = Vasco
0x2c = Atletico-MG
0x2e = União

# == Europe Teams ==
0x30 = Ajax
0x32 = PSG
0x34 = Bayern
0x36 = Juventus
0x38 = Real Madrid
0x3a = Barcelona

# == Libertadores Teams ==
0x3c = Boca Juniors
0x3e = River Plate
0x40 = Independiente
0x42 = Penarol
0x44 = Univ de Chile
0x46 = Colo Colo

# == All-Star Teams ==
0x48 = Brasil
0x4a = Brasil 58
0x4c = Brasil 96
0x4e = Europa (Europe All-Stars)
0x50 = America A (America All-Stars A)
0x52 = America E (America All-Stars E)

0x000da2 - Player 1 Score (8-bit)
Note: Holds the P1 score as a standard hex value

0x000da6 - P1 Team Formation (8-bit)
Values:
0x00 = 4-5-1
0x01 = 4-4-2
0x02 = 4-3-3
0x03 = 4-2-4
0x04 = 3-5-2
0x05 = 3-4-3
0x06 = 3-3-4
0x07 = 3-2-5
0x08 = 2-5-3
0x09 = 2-4-4
0x0a = 2-3-5
0x0b = 5-4-1
0x0c = 5-3-2
0x0d = 5-2-3
0x0e = 1-5-4
0x0f = 1-4-5


0x000daa - P1 Total Shots (8-bit)
Note: Tracks the total number of shots taken by Player 1. Value is standard hex.


0x000dab - P1 Total Free Kicks (8-bit)
Note: Tracks the total number of free kicks taken by Player 1. Value is standard hex.


0x000dac - P1 Total Corner Kicks (8-bit)
Note: Tracks the total number of corner kicks taken by Player 1. Value is standard hex.


0x000dad - P1 Total Penalties (8-bit)
Note: Tracks the total number of penalties taken by Player 1. Value is standard hex.


0x000dae - P1 Total Yellow Cards (8-bit)
Note: Tracks the total number of yellow cards received by Player 1. Value is standard hex.


0x000daf - P1 Total Red Cards (8-bit)
Note: Tracks the total number of red cards received by Player 1. Value is standard hex.


0x000db0 - P1 Total Substitutions (8-bit)
Note: Tracks the total number of substitutions made by Player 1. Value is standard hex.


0x000de2 - P1 Goalkeeper Skill Level (8-bit)
Values:
0x00 = Very Weak
0x01 = Weak
0x02 = Normal
0x03 = Good
0x04 = Strong


0x000ea0 - Team P2 ID (8-bit)
# == Brazil Teams ==
0x00 = Cruzeiro
0x02 = Palmeiras
0x04 = Botafogo
0x06 = Parana
0x08 = Bragantino
0x0a = Guarani
0x0c = Gremio
0x0e = Juventude
0x10 = Flamengo
0x12 = Paysandu
0x14 = Corinthians
0x16 = Vitoria
0x18 = Fluminense
0x1a = Internacional
0x1c = Santos
0x1e = São Paulo
0x20 = Portuguesa
0x22 = Goias
0x24 = Criciuma
0x26 = Bahia
0x28 = Sport
0x2a = Vasco
0x2c = Atletico-MG
0x2e = União

# == Europe Teams ==
0x30 = Ajax
0x32 = PSG
0x34 = Bayern
0x36 = Juventus
0x38 = Real Madrid
0x3a = Barcelona

# == Libertadores Teams ==
0x3c = Boca Juniors
0x3e = River Plate
0x40 = Independiente
0x42 = Penarol
0x44 = Univ de Chile
0x46 = Colo Colo

# == All-Star Teams ==
0x48 = Brasil
0x4a = Brasil 58
0x4c = Brasil 96
0x4e = Europa (Europe All-Stars)
0x50 = America A (America All-Stars A)
0x52 = America E (America All-Stars E)


0x000ea2 - Player 2 Score (8-bit)
Note: Holds the P2 score as a standard hex value


0x000ea6 - P2 Team Formation (8-bit)
Values:
0x00 = 4-5-1
0x01 = 4-4-2
0x02 = 4-3-3
0x03 = 4-2-4
0x04 = 3-5-2
0x05 = 3-4-3
0x06 = 3-3-4
0x07 = 3-2-5
0x08 = 2-5-3
0x09 = 2-4-4
0x0a = 2-3-5
0x0b = 5-4-1
0x0c = 5-3-2
0x0d = 5-2-3
0x0e = 1-5-4
0x0f = 1-4-5


0x000eaa - P2 Total Shots (8-bit)
Note: Tracks the total number of shots taken by Player 2. Value is standard hex.


0x000eab - P2 Total Free Kicks (8-bit)
Note: Tracks the total number of free kicks taken by Player 2. Value is standard hex.


0x000eac - P2 Total Corner Kicks (8-bit)
Note: Tracks the total number of corner kicks taken by Player 2. Value is standard hex.


0x000ead - P2 Total Penalties (8-bit)
Note: Tracks the total number of penalties taken by Player 2. Value is standard hex.


0x000eae - P2 Total Yellow Cards (8-bit)
Note: Tracks the total number of yellow cards received by Player 2. Value is standard hex.


0x000eaf - P2 Total Red Cards (8-bit)
Note: Tracks the total number of red cards received by Player 2. Value is standard hex.


0x000eb0 - P2 Total Substitutions (8-bit)
Note: Tracks the total number of substitutions made by Player 2. Value is standard hex.


0x000ee2 - P2 Goalkeeper Skill Level (8-bit)
Values:
0x00 = Very Weak
0x01 = Weak
0x02 = Normal
0x03 = Good
0x04 = Strong


0x0014ee - Pause Menu (8-bit)
Values:
0x00 = Resume
0x01 = Replay


0x00154e - Weather (8-bit)
Values:
0x00 = Snow
0x01 = Good
0x02 = Rain


0x0016d2 - Game Timer - Seconds (8-bit)
Note: Stores the seconds portion of the game timer. The value is standard hexadecimal (Hex=Dec).


0x0016d3 - Game Timer - Minutes (8-bit)
Note: Stores the minutes portion of the game timer. The value is standard hexadecimal.


0x0016d4 - Game Timer - Frames (8-bit)
Note: Stores the frames (centiseconds) portion of the game timer.


0x0019ac - Coin Toss Call (8-bit)
Note: Registers the players call before the toss.
Values:
0x00 = Heads
0x01 = Tails


0x0019b8 - Coin Toss Result (8-bit)
Note: The actual result of the referees coin toss.
Values:
0x00 = Heads
0x01 = Tails


0x0019c8 - Kick-off/Side Selection (8-bit)
Note: Active after the toss. If the player won, all 3 options are available.
Values:
0x00 = Start with Ball
0x01 = Home Side (Left)
0x02 = Away Side (Right)


0x001d08 - Voice Line ID / Event Trigger (8-bit)
Note: Indicates the sound/voice line currently being played.
Values:
0x01 = Corner Kick
0x02 = Goal Kick
0x03 = Throw-in
0x04 = Free Kick
0x07 = Replay
0x08 = End of 1st Half
0x09 = Extra Time
0x0b = Player Down
0x0d = Long Pass
0x11 = Bicycle Kick
0x13 = You Lose!
0x14 = You Win!
0x27 = Kick-off / Start
0x28 = Foul
0x29 = Yellow Card
0x2c = Normal Shot
0x2d = Very Strong Shot
0x32 = Own Goal
0x34 = Strong Shot
0x38 = Goalkeeper Save
0x40 = Tackle
0x43 = Full Time / Game End
0x46 = Goal
0x48 = Barking (Dog Referee Active)


0x001e5e - Main Menu Option (8-bit)
Note: Stores the currently selected main game mode.
Values:
0x00 = Quick Match
0x01 = Championship
0x02 = Brazil Cup
0x03 = Password
0x04 = Scenarios
0x05 = Penalties
0x06 = Training
0x07 = Options


0x001e68 - P1 Number of Players (8-bit)
Values:
0x06 = 7
0x07 = 8
0x08 = 9
0x09 = 10
0x0a = 11


0x001e6a - P2 Number of Players (8-bit)
Values:
0x06 = 7
0x07 = 8
0x08 = 9
0x09 = 10
0x0a = 11


0x001f88 - Match Duration (8-bit)
Values:
0x00 = 3 Minutes
0x01 = 5 Minutes
0x02 = 7 Minutes


0x001f90 - Sound Setting (8-bit)
Values:
0x00 = Stereo
0x01 = Mono


0x001f92 - Offside Enabled (8-bit)
Values:
0x00 = Yes
0x01 = No


0x001f98 - Fouls Enabled (8-bit)
Values:
0x00 = Yes
0x01 = No


0x001f9a - Bookings Enabled (8-bit)
Values:
0x00 = Yes
0x01 = No


0x001f9c - Game Difficulty (8-bit)
Values:
0x00 = Level 1
0x01 = Level 2
0x02 = Level 3
0x03 = Level 4
0x04 = Level 5


0x001fa0 - Referee Selection (8-bit)
Values:
0x00 = Carlos
0x01 = Heinz
0x02 = Hasegaa
0x03 = Random


0x001fa2 - Stadiums (8-bit)
Values:
0x00 = Flamengo
0x01 = São Paulo
0x02 = Vasco
0x03 = Bahia
0x04 = Palmeiras
0x05 = Gremio
0x06 = Fluminense
0x07 = Botafogo


0x001fe0 - Extra Time Enabled (8-bit)
Values:
0x00 = No
0x01 = Yes


0x00d442 - Player 1 Penalty Score (8-bit)
Note: Holds the P1 score during a penalty shootout. Value is standard hex.


0x00d443 - Player 2 Penalty Score (8-bit)
Note: Holds the P2 score during a penalty shootout. Value is standard hex.


0x00d474 - P1 Player Condition (8-bit)
Values:
0x00 = Terrible (Purple/Down)
0x01 = Bad (Blue/Down-Right)
0x02 = Average (Green/Right)
0x03 = Good (Orange/Up-Right)
0x04 = Excellent (Red/Up)
0x05 = Random


0x00d476 - P2 Player Condition (8-bit)
Values:
0x00 = Terrible (Purple/Down)
0x01 = Bad (Blue/Down-Right)
0x02 = Average (Green/Right)
0x03 = Good (Orange/Up-Right)
0x04 = Excellent (Red/Up)
0x05 = Random


0x00d706 - Scenario Modes Won (9-12) (8-bit)
Note: This is a bitfield. Each bit corresponds to a completed scenario.
Values:
Bit 3 = Scenario 9 Won (0x08)
Bit 2 = Scenario 10 Won (0x04)
Bit 1 = Scenario 11 Won (0x02)
Bit 0 = Scenario 12 Won (0x01)


0x00d88d - Scenario Modes Won (1-8) (8-bit)
Note: This is a bitfield. Each bit corresponds to a completed scenario.
Values:
Bit 7 = Scenario 1 Won (0x80)
Bit 6 = Scenario 2 Won (0x40)
Bit 5 = Scenario 3 Won (0x20)
Bit 4 = Scenario 4 Won (0x10)
Bit 3 = Scenario 5 Won (0x08)
Bit 2 = Scenario 6 Won (0x04)
Bit 1 = Scenario 7 Won (0x02)
Bit 0 = Scenario 8 Won (0x01)


0x00d88e - Scenario 1 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 1. Starts at 0x00.


0x00d88f - Scenario 2 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 2.


0x00d890 - Scenario 3 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 3.


0x00d891 - Scenario 4 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 4.


0x00d892 - Scenario 5 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 5.


0x00d893 - Scenario 6 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 6.


0x00d894 - Scenario 7 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 7.


0x00d895 - Scenario 8 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 8.


0x00d896 - Scenario 9 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 9.


0x00d897 - Scenario 10 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 10.


0x00d898 - Scenario 11 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 11.


0x00d899 - Scenario 12 Attempt Count (8-bit)
Note: Tracks the number of times the player has attempted Scenario 12.


0x00e528 - Challenge Mode Active (8-bit)
Note: Flag that indicates if the specific Challenge Mode logic is running.
Values:
0x00 = Inactive
0x01 = Active


0x00e52a - Selected Scenario (8-bit)
Note: Stores the currently selected scenario (01-12).
Values:
0x00 = Scenario 01
0x01 = Scenario 02
0x02 = Scenario 03
0x03 = Scenario 04
0x04 = Scenario 05
0x05 = Scenario 06
0x06 = Scenario 07
0x07 = Scenario 08
0x08 = Scenario 09
0x09 = Scenario 10
0x0a = Scenario 11
0x0b = Scenario 12


0x00e52c - Challenge Mode Type (8-bit)
Note: Determines which mini-game is currently selected/active in Challenge Mode.
Values:
0x00 = Dribble Challenge
0x01 = Pass Challenge
0x02 = Shoot Challenge
0x03 = Defense Challenge
0x04 = Corner Kick Challenge
0x05 = Free Kick Challenge


0x00e52e - Challenge Mode Level (8-bit)
Note: Selects the difficulty level for the chosen challenge.
Values:
0x00 = Level 1
0x01 = Level 2
0x02 = Level 3
0x03 = Level 4


0x00e534 - Training Mode Active (8-bit)
Note: Flag that indicates if the specific Training Mode logic is running.
Values:
0x00 = Inactive
0x01 = Active