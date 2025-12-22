A = 41
B = 42
C = 43
D = 44
E = 45
F = 46
G = 47
H = 48
I = 49
J = 4A
K = 4B
L = 4C
M = 4D
N = 4E
O = 4F
P = 50
Q = 51
R = 52
S = 53
T = 54
U = 55
V = 56
W = 57
X = 58
Y = 59
Z = 5A


Essas são as flags me ajude a entender e a resolver o problema da conquista

Resetif

The ResetIf can be chosen in the Flag column of the Achievement Editor
If the associated condition is true, all hit counts in the achievement will be reset to 0. This includes hit counts in other groups (more about it in Alt Groups below).
The achievement will not trigger if one or more ResetIf conditions is true, even if there are no conditions with hit count targets.
You can see many examples of ResetIf in the Real Examples page.
ResetIf with hit counts
A ResetIf condition with a hit count will only trigger when the hit count target is met.
Note: If another ResetIf condition is met, all conditions, including the ResetIf with the hit count will have their hit counts reset to 0.
It is very common to use a condition with a hit count of 1 as a start marker for an achievement, and use a ResetIf to cancel the achievement before the end condition is met. A common example is a damageless achievement: "From start of (level/battle), reset if damage taken, trigger at end of (level/battle)". When the start condition is true, a hit count is captured. If it's still set when the end condition is true, the achievement triggers. If the ResetIf condition triggers, the hit count on the start condition is set back to zero, which makes the condition false when evaluating the state when the end condition is true, and the achievement will not trigger.

=============

ResetNextIf

The ResetNextIf Flag is a special version of the ResetIf Flag that only resets the hit count of the following condition.
ResetNextIf has the same priority as the condition that it's attached to. If followed by a PauseIf, it can be used to reset that specific PauseIf without needing an alt. If attached to a standard condition, it will not be processed if the achievement is paused.
AddAddress, AddSource, and SubSource are combining modifier conditions and are not considered as the following condition. The ResetNextIf will apply to the next non-modified condition.
AndNext and OrNext are combining logical conditions and will have their hit counts reset, as well as whatever condition follows them.
All other condition flags, including AddHits and SubHits, will cause processing of the ResetNextIf behavior to stop.

=============

PauseIf

The PauseIf flag can be chosen in the Flag column of the Achievement Editor.
PauseIf is usually used to prevent hit counts from going up during a specific situation (like when the game is paused). It's used when you want to keep previously earned hit count, but don't want to increment it or reset it while something else is going on.
When a group is processed, first all PauseIf are evaluated in order. As soon as any PauseIf is true, the group stops processing. This means that any PauseIfs after the true PauseIf will not be evaluated. This allows one PauseIf to prevent another PauseIf from collecting hits, but it's usually better to write the second PauseIf with an AndNext to limit when it collects hits.
This also means that any ResetIfs in the group will not be processed while the group is paused. To reset the hit count on a PauseIf, you must place the ResetIf in an alt group or attach a ResetNextIf to the PauseIf.
Delta values are not affected by paused groups. The value returned by a delta read will still be from the previous frame, not from the frame just before the group was paused.
PauseIf with hit counts
A PauseIf condition with a hit count target will only trigger when the hit count target is met. Once the hit count target is met, the group remains paused until the hit count is reset by a ResetIf in another group or a ResetNextIf attached to the PauseIf. You may hear this referred to as a PauseLock.

A PauseIf without a hit count will automatically unpause when the condition is no longer true.

=============

AndNext and OrNext

AndNext and OrNext are used to associate more than one condition to a ResetIf, PauseIf, or Hit Count.
AndNext and OrNext can be chosen in the Flag column of the Achievement Editor
When a condition has the AndNext flag, the condition must be true in addition to the following condition for the following condition to be considered true.
When a condition has the OrNext flag, the condition or the following condition must be true for the following condition to be considered true.
You can chain multiple AndNext and OrNext conditions to create complex requirements for a single ResetIf, PauseIf, or Hit Count.
When evaluating a combination of AndNext and OrNext conditions, each line is evaluated individually.


AndNext A = 1
OrNext  B = 1
AndNext C = 1
OrNext  D = 1
AndNext E = 1
ResetIf F = 1
Represents the following logical statement:


reset if (((((A = 1 and B = 1) or C = 1) and D = 1) or E = 1) and F = 1)
Alt Groups are still preferred over OrNext for most use cases. They allow for multiple conditions to be present in each clause of the OR, and support more than two clauses.

AndNext is not required for simple logic. All conditions in a group are automatically AND'd together. AndNext just allows for two or more conditions to affect a single PauseIf, ResetIf, or Hit Count.


=============

AddSource

Note: most likely this technique is not needed for simple games. So, it's not mandatory for jr-devs.

The AddSource can be chosen in the Flag column of the Achievement Editor
When a condition has the AddSource flag, the value on that memory address is added to the accumulator. When a condition is reached that does not modify the accumulator, the accumulator is added to value of the address on that condition before the comparison is made, and the accumulator will be reset to 0. It may sound a bit confusing, but the example below will clarify how this works:
Simple example
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	AddSource	Mem	8-bit	0x8010					
2		Mem	8-bit	0x8020	>	Value		0x04	0 (0)
In this example the value in 0x8010 will be added to the value in 0x8020 and the comparison will check is if this sum is greater than four.
If the value in 0x8010 is 1 and the value in 0x8020 is 2, the comparison will be 1 + 2 > 4, or 3 > 4.
Trying to summarize the explanation in an image:

 Explained

Chaining
You can use the AddSource flag to sum more addresses, like in the example below:

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	AddSource	Mem	8-bit	0x8010					
2	AddSource	Mem	8-bit	0x8011					
3		Mem	8-bit	0x8020	>	Value		0x04	0 (0)
This represents value(0x8010) + value(0x8011) + value(0x8020) > 4.

Independence
The accumulator is reset after its used, so you can have multiple AddSource chains in one trigger without having to worry about them interfering with each other.

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	AddSource	Mem	8-bit	0x8010					
2		Mem	8-bit	0x8020	>	Value		0x04	0 (0)
3	AddSource	Mem	8-bit	0x8030					
4		Mem	8-bit	0x8040	<	Value		0x80	0 (0)
This represents value(0x8010) + value(0x8020) > 4 AND value(0x8030) + value(0x8040) < 0x80.

Overflow
The accumulator and all logic being performed is limited to 32-bits. If the total value exceeds 0xFFFFFFFF, there will be an overflow and only the 32 least significant bits will be used in the comparison.

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	AddSource	Mem	32-bit	0x8010					
2		Mem	32-bit	0x8020	>	Value		0x30000000	0 (0)
If 0x8010 is 0xC0000000 and 0x8020 is 0x54321ABC, then the total will be 0x114321ABC, which is more than 32-bits and will be truncated to 0x14321ABC, which is not more then 0x30000000, so the logic will evaluate false.

Using Modifiers
Additionally, you can use AddSource to modify a value. By clicking on the "Cmp" column, a dropdown will open with various math and logical operators. This allows you to modify the value before adding it to the accumulator.

*: Multiply the left side by the right side.

AddSource 8-bit Mem 0x8010 * Value 0x14 would read the 8-bit value from $8010, multiply it by 20 (0x14 hex) and then add that to the accumulator.
/: Divide the left side by the right side.

AddSource 8-bit Mem 0x8010 / Value 0x14 would read the 8-bit value from $8010, divide by 20 (rounding down) and then add that to the accumulator.
Note: If the divisor (right side) is zero, the result will be treated as a value of 0.
% Modulus operator: Divide the left side by the right side and return the remainder of the division.

AddSource 8-bit Mem 0x8010 % Value 0x14 would read the 8-bit value from $8010, divide by 20, and then add the remainder of that division to the accumulator. For example, if $8010 held a value of 43, the result of the modulus operation would be 3, which will be added to the accumulator.
Note: If the divisor (right side) is zero, the result will be treated as a value of 0.
+: Add the left side and the right side.

AddSource 8-bit Mem 0x8010 + Value 0x14 would read the 8-bit value from $8010, add 20 to it and then add that to the accumulator.
-: Subtract the right side from the left side.

AddSource 8-bit Mem 0x8010 - Value 0x14 would read the 8-bit value from $8010, subtract 20 from it and then add that to the accumulator.
&: Bitwise-mask the left side with the right side.

AddSource 8-bit Mem 0x8010 & Value 0x3f would read the 8-bit value from $8010, discard bits 6 and 7 (0x3f is 00111111 in binary) and then add that to the accumulator.
^: Bitwise-XOR the left side with the right side

AddSource 8-bit Mem 0x8010 ^ Mem 0x8011 would read the 8-bit values from $8010 and $8011, and result in a value where the resulting bits would be 1 if the same bit in the two operands differed, or 0 if the same bit in the two operands matched. This result would be added to the accumulator.
You can use memory references on the right side as well. AddSource 8-bit Mem 0x8010 * 8-bit Mem 0x8011 would read the two 8-bit values, multiply them together, and add that to the accumulator.

VERSION NOTICE

Addition, subtraction, and modulus operators are slated for the version 1.4 RA_Integration milestone. Processing support will be available in the version 11.4 rcheevos milestone.

Interaction with floats
The accumulator is typed based on the first thing added to it. If the first AddSource/SubSource of a chain is an integer, the accumulator will be an integer and any floats added to the accumulator will be floored before they're added to the accumulator. If the first AddSource/SubSource of a chain is a float, the accumulator will be a float and any integers added to the accumulator will be converted to floats before they're added to the accumulator.

Note that when the accumulator is added to the final condition, the type of the final condition is used. So if the final condition is float and the accumulator is an integer, the accumulator will be converted to a float before it's added to the final condition.

To force all floats in an AddSource chain to be floored, you need an extra first and last condition:

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	AddSource	Value		0					
2	AddSource	Mem	Float	0x1000					
3	AddSource	Mem	Float	0x1004					
4	AddSource	Mem	Float	0x1008					
5		Value		0	>	Value		12	0 (0)
Line 1 primes the accumulator as an integer, so lines 2-4 will be floored before they're added to the accumulator. Line 5 ensures the final value is an integer before doing the comparison. Without line 1, lines 2-4 would be accumulated as floats. Without line 5, the accumulator would be added to the last float without it being floored.


===============

SubSource

Note: most likely this technique is not needed for simple games. So, it's not mandatory for jr-devs.
The SubSource can be chosen in the Flag column of the Achievement Editor
Works similarly to AddSource, but the SubSource flag subtracts the calculated value from the accumulator.
Because it subtracts from the accumulator, SubSource A, B is actually B - A.

Simple example
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	SubSource	Mem	8-bit	0x8010					
2		Mem	8-bit	0x8020	>	Value		0x04	0 (0)
In this example the value in 0x8010 will be subtracted from the value in 0x8020 and the comparison will check is if this sum is greater than four.

If the value in 0x8010 is 1 and the value in 0x8020 is 2, the comparison will be -1 + 2 > 4, or 1 > 4.

NOTE: This comparison is also satisfied when the value in 0x8010 is greater than the value in 0x8020.

Using SubSource to Count Specific Increments
SubSource can also be used to track specific increases in addresses. The conditions below states that the current value in address 0x80dc minus the value in the previous frame in the same address must be equal 2. Effectively, this means that the condition is true whenever the value in address 0x80dc increases by exactly two.

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	SubSource	Delta	8-bit	0x80dc					
2		Mem	8-bit	0x80dc	=	Value		0x02	0 (0)
Checking for a Negative Result
The accumulator and all logic performed is limited to an unsigned 32-bit number. If the total drops below 0, it underflows, resulting in a very large positive number. Here's the representation for the first few negative numbers:

-1 is 0xFFFFFFFF
-2 is 0xFFFFFFFE
-3 is 0xFFFFFFFD
-4 is 0xFFFFFFFC
-5 is 0xFFFFFFFB
-6 is 0xFFFFFFFA
-7 is 0xFFFFFFF9
and so on...
So, if you wanted to see if a value was 1 less than another value, you could write:

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	SubSource	Mem	8-bit	0x8020					
2		Mem	8-bit	0x8010	=	Value		0xffffffff	0 (0)
This would be true if the value at $8010 (1) was 1 less than the value at $8020 (2): 1 - 2 = -1 = 0xFFFFFFFF.

However, you should swap the conditions to make it easier to read (B - A = -1) is the same as (A - B = 1):

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	SubSource	Mem	8-bit	0x8010					
2		Mem	8-bit	0x8020	=	Value		1	0 (0)
This evaluates -1 + 2 = 1, which is true.

Subtracting negative constants
It is also possible to use straight negative numbers in the left section of your Sub/AddSource operations. To do so, remember to change the Type from Mem to Value, and use the values as explained above, such as 0xFFFFFFE5 for -27, and 0xFFFFFFE3 for -29, for example:

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	SubSource	Mem	32-bit	0x8020					
2		Value		0xffffffe5	=	Value		0xffffffe3	0 (0)
If $8020 contains 2, this would be true. -2 + (-27) = -29, which is -2 - 27 = -29, which is true.

If you use a negative number in a SubSource flag, it will result in a double negative, turning the number back to positive.

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	SubSource	Value		0xfffffffe					
2		Value		0xffffffe5	=	Value		0xffffffe3	0 (0)
This means -(-2) + (-27) = -29, which is 2 - 27 = -29, which is -25 = -29, which is false.

Using Modifiers
Like AddSource, you can click the "Cmp" column to add a modifier to perform and operation that modifies the value before subtracting it from the accumulator. See Add Source - Using Modifiers for more details.


================

AddHits and SubHits

NOTE: This technique is not needed for simple games, so it is not mandatory for jr-devs.
AddHits and SubHits can be chosen in the Flag column of the Achievement Editor.
The AddHits/SubHits conditions do not have to be true for the achievement to trigger. They modify the hit count of another condition, which does have to be true for the achievement to trigger. The sequence of conditions is referred to as a AddHits chain (even if it contains SubHits).
When a condition with the AddHits/SubHits flag is true, the hit count for that condition is incremented. A hit target may be placed on the condition to keep it from tallying too many times.
The total hit count of the final condition in a chain is incremented by the hit counts of any AddHits conditions in the chain, and decremented by any SubHits conditions in the chain. If the total hit count meets or exceeds the target hit count of the final condition, it's considered true.
If the final condition of the chain does not have a hit target, the AddHits/SubHits conditions have no effect on the achievement. The final condition will be true if, and only if, it is true by itself.
NOTE: The hit target on the final condition of the chain serves as both the overall target hit count and the maximum hit count for that condition. As a result, it is impossible to use SubHits without AddHits, as any hits subtracted by the SubHits could not be recovered without a separate AddHits. Similarly, if you need to put a condition-specific limit on the final condition of the chain, you should pull it out as an AddHits condition with the appropriate limit and use a dummy final condition with the overall hit target (i.e. 0=1 (10)). The dummy condition would never accumulate any hits of its own, and only serve to tally the other values in the chain.

============


AddAddress

AddAddress modifies the memory address(es) of the following condition by the calculated value. It works similar to AddSource, but modifies the address, not the resulting value. Additionally, it affects addresses on both sides of the condition.

AddAddress only affects the next condition. If multiple AddAddress lines are chained together, each lookup in the chain will be altered; the values won't all be added to the final lookup.

image

The 32-bit value at 0x0112F8 is a pointer to the data for the first character in the party. When the party order changes, the pointer will point at a different block of memory, but data within the block will have the same structure.

The value is an address in the actual system representation and differs from the addresses provided by the memory inspector. However, you can rely on the fact that the memory inspector represents the same memory, so while the actual address may differ, the sequence of bytes does not.
To translate the real pointer to a memory inspector address, we compare the two values. For example:

The 32-bit value at 0x0112F8 is 0x800110B8.
The memory we're interested in is at 0x011114 in the memory inspector.
Using a 24-bit read instead of a 32-bit read gives us 0x0110B8
0x011114 - 0x0110B8 = 0x00005C, so that becomes the "base address" in the second condition.
Types of Pointers
AddAddress is how RAIntegration handles pointers. There are four major types of pointer support:

Direct Pointer: The pointer contains another address that is referenced without modification. These are most commonly used for string pointers. To use a direct pointer, the base address to which the pointer is added would be 0.

Indirect Pointer: The pointer contains another address that indicates the start of some block of data. The data of interest is a fixed number of bytes into the block of data. These are commonly used for attributes of a character/object.

For both Direct and Indirect Pointers, the AddAddress line should reference the pointer, and the address in the following line should be the offset into the block of data for the information relevant to the condition. While you would typically use 0 for a Direct Pointers, the following line would also contain any value necessary to convert between a real address and a memory inspector address.

The example above is an Indirect Pointer, where the data is 0x5C bytes into a block of data. The conversion from a real address to a memory inspector address is handled by using a 24-bit read instead of a 32-bit read.

Array Index: The pointer contains an offset to apply to a fixed pointer.

Scaled Array Index: The pointer contains an offset to apply to a fixed pointer after it has been scaled.

For Array Indices, the AddAddress line should reference the offset to apply, and the following line should contain the address of the first element of the array (index 0). For example:


AddAddress 16-bit Mem 0x1234
           8-bit  Mem 0x4567
Would read a 16-bit number from 0x1234 and read the single byte that is that many bytes after 0x4567.

To scale an array index, click on the space in the Cmp column for the array index address and select the * symbol. Then enter the size of each array item in the second mem/val column. For example:


AddAddress 16-bit Mem 0x1234 * Value 4
           8-bit  Mem 0x4567
Would read a 16-bit number from 0x1234, multiply it by 4, and read the single byte that is that many bytes after 0x4567.

Chaining Pointers
AddAddress can be chained to perform multi-step lookups, but only one step at a time. As such, you can reference data pointed at by a pointer that's pointed at by another pointer, but you can't reference data in an array that's pointed at by another pointer unless either the array or the array index is at a fixed address.

Using Delta with Chained Pointers
To do a delta check on an AddAddress chain, you should only put the delta on the final condition. You want to use the current value for each step of the chain to derive the final result, and you only care about the changes in the final value. Using previous values for the pointers will have you reading invalid memory and will likely cause problems.


A) AddAddress Mem   0000
B) AddAddress Mem   0000
C)            Delta 0000
Assuming Mem: $0000=0, $0001=2, and $0002=4, this will evaluate to 0 for the first few frames, and when Mem 0 changes to 1, the following happens:


Frame N  : A = Mem[0] = 1 (delta[0] = 0), B = Mem[A] = Mem[1] = 2 (delta B = 0), C = Mem[B] = Mem[2] = 4 (delta C = 0)
Frame N+1: A = Mem[0] = 1 (delta[0] = 1), B = Mem[A] = Mem[1] = 2 (delta B = 2), C = Mem[B] = Mem[2] = 4 (delta C = 4)
You can see the entire delta chain updates in the same frame (one frame after the change occurs).

If you use Delta for A and B, something different happens:


A) AddAddress Delta 0000
B) AddAddress Delta 0000
C)            Delta 0000

Frame N  : Mem[0] = 1 (delta[0] = 0), B = Mem[deltaA] = Mem[0] = 1 (delta B = 0), C = Mem[deltaB] = Mem[0] = 1 (delta C = 0)
Frame N+1: Mem[0] = 1 (delta[0] = 1), B = Mem[deltaA] = Mem[1] = 2 (delta B = 1), C = Mem[deltaB] = Mem[1] = 2 (delta C = 1)
Frame N+2: Mem[0] = 1 (delta[0] = 1), B = Mem[deltaA] = Mem[1] = 2 (delta B = 2), C = Mem[deltaB] = Mem[2] = 4 (delta C = 2)
Frame N+3: Mem[0] = 1 (delta[0] = 1), B = Mem[deltaA] = Mem[1] = 2 (delta B = 2), C = Mem[deltaB] = Mem[2] = 4 (delta C = 4)
Not only does it take two extra frames for delta C to be correct, it has two intermediate values that are not correct. The value went from 0 to 4 in a single frame and never was 1 or 2.

Calculating your offset
Once you think that you've found your data and something that points at (or near) your data, you need to calculate the offset to use to read that data.

32-bit data at 0x821448 (RetroAchievements address)
Pointer at 0xA1CA14 (RetroAchievements address) (value is 0x8C821440)
First, determine how much of the pointer you need. For a system with 16MB of RAM, you need 24-bits to address it all (2^24 = 16777216). For 32MB, you'd need 25-bits. For 8MB, you'd only need 23-bits.

For the data provided above, we have 16MB of memory, so we only need 24-bits of the pointer (0x8C821440 & 0x00FFFFFF = 0x821440)

Then, subtract that value from the data address to calculate the offset: 0x821448 - 0x821440 = 0x000008

Now, you can construct the logic. Place the pointer address and size/mask in the AddAddress condition and the offset/logic in the second line:


AddAddress Mem 24-bit 0x00A1CA14
           Mem 32-bit 0x00000008 < 1000
Executing this example with the provided data:

Read 24-bit data at 0x00A1CA14: 0x00821440
Add the offset: 0x00821440 + 0x00000008 = 0x00821448
Read 32-bit data at new address (0x00821448)
Second example
16-bit data at 0x1B385E0 (RetroAchievements address)
Pointer at 0xE7B054 (RetroAchievements address) (value is 0x09B42F0C)
System has 32MB of RAM (25 bits needed) 0x09B42F0C & 0x01FFFFFF = 0x1B42F0C
Calculate offset: 0x1B385E0 - 0x1B42F0C = 0xFFFFFFFFFFFF56D4 (truncate to 32-bits: 0xFFFF56D4)
Construct the logic:

AddAddress Mem 32-bit 0x00E7B054 & 0x1FFFFFF
           Mem 16-bit 0xFFFF56D4 = 0x0E
In this case, the pointer is actually pointing backwards, so the offset is a really big number. That's how computers represent negative values. Due to the rules of twos-compliment and overflow, you can add the really big number to perform subtraction. Executing this example with the provided data:

Read 32-bit data at 0x00E7B054: 0x09B42F0C
Mask off 25-bits: 0x09B42F0C & 0x01FFFFFF = 0x01B42F0C
Add the offset: 0x1B42F0C + 0xFFFF56D4 = 0x101B385E0 (truncated to 32-bits: 0x01B385E0)
Read 16-bit data at new address (0x01B385E0)

=============

Measured

Measured marks a condition for tracking progress. It adds a progress bar to the achievement overlay to inform the user how close they are to completing an achievement. As the user expects an achievement to trigger when the progress bar is full, it is expected that any other conditions in the achievement should be true most of the time.

Measured should not be used to track things that are clearly visible to the user. If you have an achievement for getting 500,000 points, you don't need to Measure it if the score is displayed on the screen. Similarly, there's no need to use Measured in an achievement for having 100 of something in the inventory if the player can see a count of how many they have just by opening the inventory.

If placed on a condition with a required HitCount, the target value is the required HitCount and the current value is the current HitCount. AddHits can be used.

If placed on a condition without a HitCount, the target value is the constant on the right side of the condition and the current value is the evaluation of the left side of the condition. AddSource and SubSource can be used.

If multiple conditions are marked as Measured and have the same target value, the current value will be the maximum of all the Measured conditions.

If multiple conditions are marked as Measured and have different target values, a Parse Error -22 will occur.

Note that progress for Measured values is reported at the time of examination and may actually go down depending on the current value (Hit Count could be reset, or comparison value decreases).

Limiting When a Measurement Appears or Changes
You will find cases where you don't want a measurement to update or where a measurement is invalid. You can use Pause If or Measured If to manage these cases.

Using Measured If with Measured:
To limit the scope of a Measured condition, you can add a MeasuredIf condition. A MeasuredIf condition must be true for the Measured value to be non-zero (and for the achievement to trigger). You can use MeasuredIf to create achievements that require playing as a certain character, or just to prevent bogus data from showing up if the player is in the wrong part of the game. If any MeasuredIf condition in a group is false, the Measured value for the group is automatically 0.

To summarize, use Measured If when:

Conditions are such that a measurement is invalid.
Multiple possible measurement sources exist and you want to restrict which one is active
Example: When using the wrong character.
Example: When on the wrong stage or in the wrong area.
Example: Measuring something during a race, but the measurement addresses are different between single-race mode and tournament mode.
Using Pause If with Measured:
Since PauseIf has precedence over Measured, the Measured value will be captured when a group becomes paused, and the captured value will be returned until the group is unpaused and Measured can be evaluated again. If another Measured exists in a non-paused group, its value will be returned even if it is lower than the captured value.

To summarize, use Pause If when:

You want to prevent the measurement from updating or changing
The scope of the measurement is valid, but the data is volatile
Example: Pause while on a loading screen where the address(es) that normally contain or determine the measurement are used for something else
Example: Some temporary case where you don't want to count hits during a challenge (i.e. Defeat X enemies while not invincible)

==================

Trigger

Trigger marks one or more conditions in an achievement as the logic that is expected to be the final logic to become true which causes the achievement to trigger. This allows the runtime to know when an achievement is about to trigger, so a challenge indicator can be shown on the screen.

When all conditions that must be true for the achievement to trigger are true except those marked with the Trigger flag, the achievement will become Primed. It will remain Primed as long as all of the previous conditions remain true, or until the achievement triggers or is deactivated.

This functionality allows putting indicators on the screen to help players know when a challenge is active, or more importantly, when they fail the challenge.

A prime example would be for a damageless boss fight. The Trigger flag would be put on the "boss is dead" condition. When all other conditions are true (ex: in boss fight, boss at full hp (HitCount 1), not demo), the challenge indicator would be displayed. If the player takes damage, the HitCount on the "boss at full hp" condition would get reset, and the challenge indicator would go away.

Trigger should not be used if the player is not attempting a challenge. Achievements that would be earned without any additional effort from the player don't need to tell the player they're about to be earned.

Up to eight challenge indicators can be shown at one time (though rarely more than one or two should be). If indicators and leaderboard trackers are both visible, the tracker will appear above the indicators.

Interaction with PauseIf
If the achievement is Paused while Primed, the indicator will become hidden.

If it is Paused before it is Primed, the indicator will not be shown at all until the achievement is unpaused.

When the achievement becomes unpaused, the indicator may be displayed or hidden depending on the state of the non-Trigger conditions.

=============

Remember

VERSION NOTICE

This feature will be available at the RA_Integration version 1.4 milestone for developers, with support to be added for rcheevos version 11.4 milestone.

The Remember condition is chosen in the Flag column of the Asset Editor. Since many of the use cases tend to be fairly complex, it is recommended you be familiar with the rest of the tool kit before studying some of the more complicated examples below.

When a condition has the Remember flag, the value of the condition is stored in the recall accumulator. This value may be used in later logic by using the Recall operand found in the Type column of either side.

There is one remembered value per group (Core, Alt1, Alt2, etc). This value is initialized at the beginning of an evaluation as a unsigned integer with value 0. If you Remember a new value, it will overwrite the previously remembered value. If you remember a Float value, the remembered value will be a floating point value instead of an unsigned integer. Using Recall before a value is remembered using the Remember condition will generate a warning in the asset editor.

The Remember condition is a combining condition and does not break any chain it is in. Conditions that follow it are considered part of the chain.

Basic Usage
Simple Example
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	SubSource	Delta	16-bit	0x1234					
2	Remember	Mem	16-bit	0x1234					
In this example, the Delta value of 0x1234, the value from the previous frame, is subtracted from the Mem value of 0x1234 and remembered.

INFO

Remember sets the value of the recall accumulator.

Simple Example - With Operators
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	16-bit	0x1234	-	Delta	16-Bit	0x1234	
The Remember condition can optionally take two operands and process a value based on an operator such as multiplication, division, addition, subtraction, and others. In this example, we used the subtraction operator to store the equivalent value as in the first example, but we do it in a single line.

Using the Stored Value
To use the stored value, specify the Recall operator as the Type of operand:

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
2		Recall			=	Value		0x05	
In this example it uses the stored value and compares it to a constant value of 5. However, using the stored value once does not show off the main usefulness of Remember.

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	16-bit	0x1234	-	Delta	16-Bit	0x1224	
2	And Next	Recall			=	Value		0x05	
3	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
4	And Next	Recall			=	Value		0x14	
5	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
6	And Next	Recall			=	Value		0x64	
7	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
8	Measured	Value		0x00	=	Value		0x00	3 (0)
In this example, we are using the stored value in multiple chains within an Add Hits chain without having to recalculate the value each time. Here we are looking for specific increases of 0x1234 to occur while the value of 0x1000 is equal to 3. Perhaps 0x1234 is money, 0x1000 is the current level, and you want to make sure the player collects a gem worth 5 units of money, one worth 20, and one worth 100 in level 3. Recall is used here to check all these values of the difference between Mem and Delta without having to recalculate it each time. See the Add Hits document for more information about how that condition works.

INFO

Recall retrieves the value stored in the recall accumulator.

Interaction with Pause If
Because Pause If logic is processed before other logic, Pause If logic can only recall values that have been remembered by pause logic. Values remembered during Pause If logic continue to be remembered during the remaining logic processing.

See the Pause If document for more information about how that condition works.

Example of Use with Pause If
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	16-bit	0x1234	-	Delta	16-Bit	0x1234	
2	Pause If	Recall			>=	Value		0x80000000	1 (0)
3	And Next	Recall			=	Value		0x05	
4	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
5	And Next	Recall			=	Value		0x14	
6	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
7	And Next	Recall			=	Value		0x64	
8	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
9	Measured	Value		0x00	=	Value		0x00	3 (0)
This example extends the previous Using the Stored Value example by adding a Pause If lock if the player loses money*. Because Remember is a combining condition, it links with the following Pause If to form a chain and is processed as part of the pause processing, allowing the value to be used by the Pause If. The remembered value is available to the remaining logic and can therefore be used by the Add Hits chain.

Notes:

* Due to the way unsigned math works, the subtraction will underflow back to 0xfffffff at negative one, so any value greater or equal to 0x80000000 is treated as negative).
Because pause processing happens first, you could put conditions 1-2 at the end of the logic and it will still work! The value remembered by the pause logic will still be available to the Add Hits chain. However because this may be a confusing effect, we recommend putting your pause logic at the beginning when using it with Remember and Recall.
TIP

To avoid unexpected behavior with Remember and Recall, place pause logic that uses these features at the top of the group.

Example of Incorrect Usage with Pause If
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	16-bit	0x1234	-	Delta	16-Bit	0x1234	
2	And Next	Recall			=	Value		0x05	
3	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
4	And Next	Recall			=	Value		0x14	
5	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
6	And Next	Recall			=	Value		0x64	
7	Add Hits	Mem	8-Bit	0x1000	=	Value		0x03	1 (0)
8	Measured	Value		0x00	=	Value		0x00	3 (0)
9	Pause If	Recall			>=	Value		0x8000000	1 (0)
In this example, the Remember condition is not chained with the Pause If. Because of this, the Pause If condition will read a value of 0 from the Recall operand and never be paused, as a consequence of the pause logic being processed first. Fear not though, as the validation is smart enough to recognize this and will generate a warning on condition 9 that Recall is being used in a Pause If without a value being remembered in a Pause If.

DANGER

When using the Recall type operator in Pause If logic, be sure that the Remember condition that sets the value you wish to use is in the same Pause If chain or an earlier Pause If chain. Otherwise the recalled value with be 0!

Using Recall within a Remember Condition
You can perform math on a remembered value and remember the result:

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	16-bit	0x1002	+	Mem	16-Bit	0x1004	
2	Remember	Recall			*	Value		0x03	
3	Remember	Recall			+	Mem	16-Bit	0x1000	
4	Remember	Recall			%	Value		0x05	
5		Recall			=	Value		0x00	
In this example, let's say you need to calculate the value of 0x1000 + (0x1002 + 0x1004) * 3 and check to see if that is a multiple of 5. You can use Recall in a Remember condition to operate on the last remembered value and store the new result.

Notes:

If the value of the modulus (%) operation is 0, that means there is no remainder from the division by 5, meaning the value is a multiple of 5.
Using Remember for Calculated Pointer Offsets
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	8-bit	0x0789	*	Value		0x60	
2	AddAddress	Mem	32-bit	0x1234	+	Recall			
3		Mem	16-bit	0x08	>	Value		0x00	
In this example, let's say you have an address that points to a table of data, but in order to know where in the table you want to go, you have to calculate the offset from another source. 0x1234 will be used as the pointer to the table of data. 0x0789 will be the index in the table. The size of data for table entries is 0x60 bytes. And finally, the data we care about is 0x08 bytes into the data's structure. Perhaps this is "Player Health" and the index we are calculating is the index in the table where the "Player Data" exists and we need to check if this value is greater than 0.

See the Add Address document for more information about how that condition works.

Breakdown of Conditions:

Scales the index by the size of the data structure. Now it represents how far from the beginning of the table the data is located.
Uses the address for the start of the table and adds to it the stored value. Now this Add Address points to the start of the "Player Data" in the table.
Offsets from the Address by 0x08, where it reads the current memory value for the Player's Health with 16-bit size, then uses a comparison to check if it is greater than zero.
Deeper Chaining of Remember Conditions
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	8-bit	0x0789	*	Value		0x60	
2	AddAddress	Mem	32-bit	0x1234	+	Recall			
3	And Next	Mem	16-bit	0x08	<	Delta		0x08	0 (0)
4	AddAddress	Mem	32-bit	0x1234	+	Recall			
5	And Next	Mem	8-bit	0x24	!=	Value		0xff	0 (0)
6	AddAddress	Mem	32-bit	0x1234	+	Recall			
7	Remember	Mem	16-bit	0x24	*	Value		0x60	
8	AddAddress	Mem	32-bit	0x1234	+	Recall			
9	Reset If	Mem	8-bit	0x00	=	Value		0xa7	0 (0)
This example shows how using Remember continues the chain of And Next conditions and how you can remember new values during the chain without affecting earlier parts of the chain or breaking the chain.

In this example, we build on the previous Add Address example by chaining it with other conditions. Pretend this is a challenge that fails if the player loses health while holding a certain object. Suppose the player data stores the index of the object at offset 0x24 (the value of which is 0xff if no object is held). Suppose that index is an index into the same table that holds the player data. This example shows the reset chain that accomplishes this. Suppose that offset 0x00 of object data holds the 8-bit ID of the object.

Breakdown of Conditions:

Scales the index by the size of the data structure. Now it represents how far from the beginning of the table the data is located.
Uses the address for the start of the table and adds to it the stored value. Now this Add Address points to the start of the "Player Data" in the table.
Checks if the player lost health, using the offset for health established in the previous example.
Re-uses the address for the start of the player data
Checks the offset of the held object and makes sure it's not 0xff.
Re-uses the address for the start of the player data
Stores the index of the held object times the size of the object data and now the stored value is the location in the table where the object's data is located.
Uses the object table pointer + location in table of object
Reads the ID of the object and resets if holding the specific object while the other two core conditions in the chain are true (Player lost health and an object is held.
Other Considerations
Interaction With Floats
A remembered value will match the type of data being remembered. If operations are being performed, the first operand usually determines the type, except in the case of division (where the second operand determines the type). If you need to force an integer value to be stored as a float, you can do either of the following:

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Float		0.0	+	Mem	16-Bit	0x1234	
ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	16-Bit	0x1234	/	Float		1.0	
Integer Overflow
When the stored value is an integer, all logic being performed is limited to 32-bits. If the total value exceeds 0xffffffff, there will be an overflow and only the 32 least significant bits will be used in the comparison.

ID	Flag	Type	Size	Memory	Cmp	Type	Size	Mem/Val	Hits
1	Remember	Mem	32-bit	0x8010	+	Mem	32-Bit	0x8020	
2		Recall	>	Value		0x30000000	0 (0)		
If 0x8010 is 0xc0000000 and 0x8020 is 0x54321abc, then the total will be 0x114321abc, which is more than 32-bits and will be truncated to 0x14321abc, which is not more then 0x30000000, so the logic will evaluate false.
