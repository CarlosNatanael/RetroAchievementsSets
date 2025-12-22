0x000032 - Qualifying Grid Position Block [8-bit]
Stores the starting grid order after qualifying. Address represents Grid Position (in reverse order), and the Value is the Driver ID starting there.
Value holds ID of Driver starting in 1st Place

0x000033 - Value holds ID of Driver starting in 2nd Place
0x000034 - Value holds ID of Driver starting in 3rd Place
0x000035 - Value holds ID of Driver starting in 4th Place
0x000036 - Value holds ID of Driver starting in 5th Place
0x000037 - Value holds ID of Driver starting in 6th Place
0x000038 - Value holds ID of Driver starting in 7th Place
0x000039 - Value holds ID of Driver starting in 8th Place

0x000049 - Player Input (Controls) [8-bit] [Bitmask]
This tracks the players controller input.
0x01 = Right
0x02 = Left
0x40 = Brake
0x80 = Accelerate
0x20 = Select
0x10 = Pause

0x00006f - Shop Menu Cursor (X-Axis) [8-bit] (Partial)
This tracks the horizontal cursor, but only for the first 4 items (values 0x00 to 0x03). For items 5 and 6, this address locks at 0x03. This address must be used WITH 0x000075

0x000073 - Shop Menu Cursor (Y-Axis) [8-bit]
0x00 = Chassis
0x01 = Mission (Gearbox)
0x02 = Brake
0x03 = Suspension
0x04 = Diffuser
0x05 = Front Wing
0x06 = Rear Wing
0x07 = Tire
0x08 = Engine
0x09 = Nitro
0x0a = Exit

0x000075 - Shop Menu Page (X-Axis) [8-bit] [Bitmask]
This tracks the "page" or "scroll" of the shop menu. It works with 0x00006f to get the true item.
0x00 = Page 1 (Items 1-4)
0x40 = Page 2 (Item 5)
0x80 = Page 3 (Item 6)

0x000076 - Car Damage [8-bit]
- This tracks car damage. Any value > 0x00 means the car is damaged.

0x00009e - Starting Grid Semaphore / Cutscene [8-bit]
Tracks the status of the race start countdown lights.
0x00 = Cutscene Active (Grid is being set up)
0x01 = Green Light / Race Start

0x0000a3 - Game Cutscene/Event ID Block [8-bit]
These 3 bytes work together to identify the current fullscreen cutscene/event.
0x20 0x90 0x1d = Victory Lane (End of Championship - Champion Only)
0xed 0xe7 0x1f = End of Season Points Tally (End of Championship)
0xb7 0xd3 0x1f = Next Season Transition (End of Championship)
0x77 0xda 0x12 = Prize Money Screen (Post-Race)
0x3b 0xaa 0x1c = Rank Driver Screen (Post-Race)

0x0000a4 - Game Cutscene/Event ID Block [8-bit]
These 3 bytes work together to identify the current fullscreen cutscene/event.

0x0000a5 - Game Cutscene/Event ID Block [8-bit]
These 3 bytes work together to identify the current fullscreen cutscene/event.

0x0000a9 - Lap Counter / Race Status Flag [8-bit]
Tracks lap progression and race end state. Value increments after crossing the start/finish line.
0x01 = Race Start / During Lap 1
0x02 = Lap 1 Completed / During Lap 2
0x03 = Lap 2 Completed / During Lap 3
0x04 = Final Lap Completed (Race Finished Flag)

0x0000ad - Total Race Timer [8 bit] [BCD]
- Minutes (e.g., 0x02)

0x0000ae - Total Race Timer [8 bit] [BCD]
- Seconds (e.g., 0x28)

0x0000b0 - Total Race Timer [8 bit] [BCD]
Centiseconds/Milliseconds (e.g., 0x78)

0x00059b - Player Car Upgrade Levels Block [8-bit] (Chassis)
Tracks the current purchased level for each upgrade part.
0x00 = TYPE 1
0x01 = TYPE 2
0x02 = TYPE 3

0x00059c - Player Car Upgrade Levels Block [8-bit] (Transmission/Gearbox Level)
Tracks the current purchased level for each upgrade part.
0x00 = 4SPEED
0x01 = 5SPEED
0x02 = 6SPEED
0x03 = 7SPEED

0x00059d - Player Car Upgrade Levels Block [8-bit] (Brake Level)
Tracks the current purchased level for each upgrade part.
0x00 = MORNAL
0x01 = CARBON
0x02 = AMTILOCK

0x00059e - Player Car Upgrade Levels Block [8-bit] (Suspension Level)
Tracks the current purchased level for each upgrade part.
0x00 = SOFT
0x01 = HARD
0x02 = ACTIVE

0x00059f - Player Car Upgrade Levels Block [8-bit] (Diffuser Level)
Tracks the current purchased level for each upgrade part.
0x00 = SMALL
0x01 = MORNAL
0x02 = LARGE
0x03 = SPECIAL

0x0005a0 - Player Car Upgrade Levels Block [8-bit] (Front Wing Level)
Tracks the current purchased level for each upgrade part.
0x00 = LOW D.F
0x01 = MORNAL
0x02 = HI D.F
0x03 = SPECIAL.L
0x04 = SPECIAL.W

0x0005a1 - Player Car Upgrade Levels Block [8-bit] (Rear Wing Level)
Tracks the current purchased level for each upgrade part.
0x00 = LOW D.F
0x01 = MORNAL
0x02 = HI D.F

0x0005a2 - Player Car Upgrade Levels Block [8-bit] (Tire Level)
Tracks the current purchased level for each upgrade part.
0x00 = SPARE
0x01 = RAIN
0x02 = NORMAL
0x03 = HIGRIP
0x04 = SPECIAL

0x0005a3 - Player Car Upgrade Levels Block [8-bit] (Engine Level)
Tracks the current purchased level for each upgrade part.
0x00 = JADD V8
0x01 = FORO V8
0x02 = ILMOA V10
0x03 = REMARTY V10
0x04 = FERARI V12
0x05 = HOMDA V12

0x0005a4 - Player Car Upgrade Levels Block [8-bit] (Nitro Level ('Nitro'))
Tracks the current purchased level for each upgrade part.

0x0005c7 - Nitro Fuel Level [8-bit]
Tracks the current amount of Nitro fuel available.
0x04 = Full (100%)
0x03 = ~70%
0x02 = ~50%
0x01 = ~20%
0x00 = Empty

0x0006d0 - Casino Minigame - Roulette Selector [8-bit]
Tracks the cursor position on the Casino roulette wheel.
0x00 = No selection / Spinning
0x01 = Selector 1
0x02 = Selector 2
0x03 = Selector 3
0x04 = Selector 4
0x05 = Selector 5

0x000731 - Player Lap Times Block - Start [8-bit BCD per segment]
Stores the players completed lap times. Appears to be BCD format.
0x000731 / 0x000732 / 0x000733 = Lap 1 (Mins / Secs / MS)
0x000735 / 0x000736 / 0x000737 = Lap 2 (Mins / Secs / MS)
0x000739 / 0x00073a / 0x00073b = Lap 3 (Mins / Secs / MS)

0x000741 - AI Opponent Lap Times Block - Start [8-bit BCD per segment]
Appears to store completed lap times for AI opponents, structured similarly to the player block (0x000741) / (0x00074b). Seems active during Race mode.

0x000751 - AI Opponent Lap Times Block - Start [8-bit BCD per segment]
Appears to store completed lap times for AI opponents, structured similarly to the player block (0x000751) / (0x00075b). Seems active during Race mode.

0x000761 - AI Opponent Lap Times Block - Start [8-bit BCD per segment]
Appears to store completed lap times for AI opponents, structured similarly to the player block (0x000761) / (0x00076b). Seems active during Race mode.

0x000771 - AI Opponent Lap Times Block - Start [8-bit BCD per segment]
Appears to store completed lap times for AI opponents, structured similarly to the player block (0x000771) / (0x00077b). Seems active during Race mode.

0x000781 - AI Opponent Lap Times Block - Start [8-bit BCD per segment]
Appears to store completed lap times for AI opponents, structured similarly to the player block (0x000781) / (0x00078b). Seems active during Race mode.

0x000791 - AI Opponent Lap Times Block - Start [8-bit BCD per segment]
Appears to store completed lap times for AI opponents, structured similarly to the player block (0x000791) / (0x00079b). Seems active during Race mode.

0x0007a1 - AI Opponent Lap Times Block - Start [8-bit BCD per segment]
Appears to store completed lap times for AI opponents, structured similarly to the player block (0x0007a1) / (0x0007ab). Seems active during Race mode.

0x0007b1 - AI Race Position Block (WRAM) [8-bit]
- Position for FER (T. PHILIPS)

0x0007b2 - AI Race Position Block (WRAM) [8-bit]
- Position for LEY (M. OWEM)

0x0007b3 - AI Race Position Block (WRAM)[8-bit]
- Position for MCL (A. SETA)

0x0007b4 - AI Race Position Block (WRAM) [8-bit]
- Position for WIL (N.J. MYDEN)

0x0007b5 - AI Race Position Block (WRAM) [8-bit]
- Position for TYR (J. SPOHN)

0x0007b6 - AI Race Position Block (WRAM) [8-bit]
- Position for BEN (R. PALUKA)

0x0007b7 - AI Race Position Block (WRAM) [8-bit]
- Position for JOR (M. FLAERTY)

0x0007d9 - Player Race Position [8-bit] (0-Based)
- it is updated only at the end of each completed lap (when crossing the start/finish line). It holds the value 0x00 during the first lap until the first crossing.
0x00 = 1st Place
0x01 = 2nd Place
0x02 = 3rd Place
0x03 = 4th Place
0x04 = 5th Place
0x05 = 6th Place
0x06 = 7th Place
0x07 = 8th Place

0x0007dd - Game State / Current Screen [8-bit]
Tracks the current screen or game mode.

-- Core Gameplay States --
0x0d = Race Session
0x0e = Qualifying Session
0x11 = Car Setup Screen
0x10 = Initial Menus
0x0a = Casino Minigame
0x0b = Save Data Screen
0x0c = Next Track Intro Screen

-- Post-Race Result Screens --
0x05 = Post-Qualifying Results Screen

-- Post-Championship Race Result Screens (By Rank) --
0x07 = Overall Classification Results Screen (Victory - 1st Place)
0x08 = Post-Race Results Screen (Finished 2nd or 3rd Place)
0x04 = Post-Race Results Screen (Finished 4th, 5th, or 6th Place)
0x03 = Post-Race Results Screen (Finished 7th or 8th Place)
0x06 = Overall Classification Results Screen (Final results screen when finishing 4th-8th)

0x001390 - Overall Championship Standings Block [8-bit]
This block stores the current championship ranking. The logic is inverted: Address represents the Rank, and the Value is the Driver ID holding that rank.
0x00 = Player
0x01 = T. PHILIPS (FER)
0x02 = M. OWEM (LEY)
0x03 = A. SETA (MCL)
0x04 = N.J. MYDEN (WIL)
0x05 = J. SPOHN (TYR)
0x06 = R. PALUKA (BEN)
0x07 = M. FIAERTY (JOR)
Value holds ID of Driver in 1st Place

0x001391 - Value holds ID of Driver in 2nd Place
0x001392 - Value holds ID of Driver in 3rd Place
0x001393 - Value holds ID of Driver in 4th Place
0x001394 - Value holds ID of Driver in 5th Place
0x001395 - Value holds ID of Driver in 6th Place
0x001396 - Value holds ID of Driver in 7th Place
0x001397 - Value holds ID of Driver in 8th Place

0x0013b8 - Round - Stage [8bit]
- Value = Mem - 1
- Ex.: Round 4 = 0x03

0x0013de - Current Circuit [8-bit]
0x00 = Italy
0x01 = Great Britain
0x02 = Germany
0x03 = Brazil
0x04 = San Marino
0x05 = Spain
0x06 = Portugal
0x07 = Mexico
0x08 = Hungary
0x09 = Canada
0x0a = France
0x0b = Belgium
0x0c = Australia
0x0d = U.S.A
0x0e = Monaco
0x0f = Japan

0x0013e0 - Current Weather Condition [8-bit]
Tracks the weather for the current race/session.
0x00 = Sunny Day
0x01 = Light Rain
0x02 = Heavy Rain

0x0013e2 - Total Player Money (Wallet) [16-bit]
- This is the main "wallet" address. The value is stored divided by 10.
Example 1: 0x03e8 (1000) = $10,000 on screen.
Example 2: 0x0032 (50) = $500 on screen.

0x0013e6 - Current F1 Season ID [8-bit]
Tracks the players current F1 season
0x01 = F1 Season 1
0x02 = F1 Season 2

0x0013e8 - Active Player Name - Char 1 [8-bit ASCII]
0x0013e9 - Active Player Name - Char 2 [8-bit ASCII]
0x0013ea - Active Player Name - Char 3 [8-bit ASCII]
0x0013eb - Active Player Name - Char 4 [8-bit ASCII]
0x0013ec - Active Player Name - Char 5 [8-bit ASCII]
0x0013ed - Active Player Name - Char 6 [8-bit ASCII]
0x0013ee - Active Player Name - Char 7 [8-bit ASCII]
0x0013ef - Active Player Name - Char 8 [8-bit ASCII]
0x0013f0 - Active Player Name - Char 9 [8-bit ASCII]

0x0013f8 - Name IA opponents Char 1-9 [8-bit ASCII]
0x0013f8 - 0x001400 = T.PHILIPS

0x001408 - Name IA opponents Char 1-9 [8-bit ASCII]
0x001408 - 0x001410 = M.OWEM

0x001418 - Name IA opponents Char 1-9 [8-bit ASCII]
0x001418 - 0x001421 = A.SETA

0x001428 - Name IA opponents Char 1-9 [8-bit ASCII]
0x001428 - 0x001430 = N.J.MYDEN

0x001438 - Name IA opponents Char 1-9 [8-bit ASCII]
0x001438 - 0x001440 = J.SPOHN

0x001448 - Name IA opponents Char 1-9 [8-bit ASCII]
0x001448 - 0x001450 = R.PALUKA

0x001458 - Name IA opponents Char 1-9 [8-bit ASCII]
0x001458 - 0x001460 = M.FLAERTY

0x001468 - Championship Points Awarded (at Race End) [8-bit]
This stores the points awarded when you finish a championship race.
0x0A = 1st Place (10 pts)
0x06 = 2nd Place (6 pts)
0x04 = 3rd Place (4 pts)
0x03 = 4th Place (3 pts)
0x02 = 5th Place (2 pts)
0x01 = 6th Place (1 pt)

0x001469 - Championship Points IA (T. PHILIPS) [8-bit]
0x00146a - Championship Points IA (M. OWEM) [8-bit]
0x00146b - Championship Points IA (A. SETA) [8-bit]
0x00146c - Championship Points IA (N.J. MYDEN) [8-bit]
0x00146d - Championship Points IA (J. SPOHN) [8-bit]
0x00146e - Championship Points IA (R. PALUKA) [8-bit]
0x00146f - Championship Points IA (M. FLAERTY) [8-bit]

0x0014f1 - Recycled ASCII Display Buffer - Start (approx. 7 bytes: 0x14f1-0x14f7) [8-bit ASCII]
This buffer is recycled by the game.
STATE 1 (In-Race/End): Displays the players "Best Lap Time" as an ASCII string (e.g., "0:42.27").
STATE 2 (Prize Screen): Displays the "Prize Money" earned as an ASCII string (e.g., " 4000").
(This is the prize display, not the total money address.)

0x00153f - Select Player Cursor [8-bit]
- 0x00 = Name1
- 0x01 = Name2
- 0x02 = Name3
- 0x03 = Name4
- 0x04 = New
- 0x05 = NameChange

0x001222 - Casino Win Display - Thousands [8-bit]
Note: Controls the thousands digit shown in the "WIN" box on the slot machine.
Values:
0x3f = Empty/Space
0xF0 = 0
0xF1 = 1
0xF2 = 2
0xF3 = 3
0xF4 = 4
0xF5 = 5
...

0x001223 - Casino Win Display - Hundreds [8-bit]
Note: Controls the hundreds digit shown in the "WIN" box on the slot machine.
Values:
0x3f = Empty/Space
0xF0 = 0
0xF1 = 1
0xF2 = 2
0xF3 = 3
0xF4 = 4
0xF5 = 5
...

0x001224 - Casino Win Display - Tens [8-bit]
Note: Controls the tens digit shown in the "WIN" box on the slot machine.
Values:
0x3f = Empty/Space
0xF0 = 0
0xF1 = 1
0xF2 = 2
0xF3 = 3
0xF4 = 4
0xF5 = 5
...

0x001225 - Casino Win Display - Units [8-bit]
Note: Controls the units digit shown in the "WIN" box on the slot machine.
Values:
0x3f = Empty/Space
0xF0 = 0
0xF1 = 1
0xF2 = 2
0xF3 = 3
0xF4 = 4
0xF5 = 5
...
