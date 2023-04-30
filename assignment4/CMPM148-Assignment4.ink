// Assignment 4: Narrative Dialog Trees in Ink

// VARIABLES
VAR charName = "Alex"
// Global Variables - Player Character Stats
VAR obliviousness = 0 
VAR boldness = 0
VAR awkwardness = 0
VAR affection = 0
VAR discontentment = 0
// Global Variables - Callbacks
VAR driver = true
VAR held_hands = false
VAR movie_choice = "default"
VAR food_choice = "default"
VAR paid_for_food = false
VAR outcome = 0


// STORY CONTENT
-> firstDialog
// First Dialouge Tree
=== firstDialog ===
Sitting inside of the car, you watch the first few red and orange leaves flutter down from the trees alongside the road, and land atop the windshield.
It's nearing the end of summer break, your very last summer break before you head off to University.
Today, you're spending the day with one of your best friends, {charName}.
You and her met your first year of high school, and became fast friends, nearly spending every moment with one another since then.
But tomorrow, she's heading off to the other side of the country, miles and miles away, while you chose to stay close, enrolling in a University just an hour away from the town you grew up in.
{charName}'s always been incredibly smart, outclassing you in nearly every subject in school, and is exceedingly talented, so its no wonder she got accepted into some nice private school far away. But you've spent so much time with her these last four years that you can barely imagine the two of you apart.
So today, you wanted to make the most of that last bit of time before she goes off to school.
Right now, you're sitting in the...
    * passenger's seat.
        ~boldness -= 1
        ~driver = false
        {charName} was usually the one to drive in these situations. You'd rather just be along for the ride to be completely honest, and driving has always scared you a bit, so she was always happy to drive the two of you around.
    * driver's seat.
        ~boldness += 1
        ~affection += 1
        ~driver = true
        You usually drove the two of you everywhere you went, you always felt safer at the steering wheel anways.
        Not that {charName} was bad at driving or anything, but driving her around always made you feel helpful, by taking some of the burden off of her shoulders in any way that you could.
    
- "So," she says, {driver: gazing over at you from the passenger's seat | her hands placed on the steering wheel}, "where do you want to go first?"
    -> options

= options
    {movieTheater and getFood: "Thanks for{driver: driving me around today! | coming with me today!} You you wanna head home and just hang out for a few?{affection >= 5: You can spend the night over at my place and see me off tomorrow morning.}"}
    {movieTheater and not getFood : 
    {charName} looks over at you with a smile, "That movie was super good! {movie_choice == "mystery": All of the mystery aspects were so interesting, thanks for suggesting it!}{movie_choice == "romance" and awkwardness <= 0 and discontentment <= 0 and affection >= 2: The main couple in that movie were super cute together wouldn't you aggree?{affection >= 3: Their relationship actually kind of reminded me of us too, haha.}}{movie_choice == "horror" and awkwardness <= 0 and discontentment <= 0 and affection >= 2 : Gosh, that movie was pretty terrifying{boldness >= 2:, I'm suprised how little it scared you to be honest}.{boldness >= 2 and affection >= 3: Wow, I even ended up clinging onto you the whole time... I can't help it though, you're so comfy.}}"
    "Where should we go next?" she asks.
    }
    {not movieTheater and getFood: 
    {charName} looks over at you with a smile, "That was fun! The food was amazing{paid_for_food:, thanks again for treating me!} Should we do anything else before we finish up for the day?" 
    }
    {not movieTheater and not getFood:
        * [Ask her what she wants to do.]
            "What do you think we should do?" you ask, hoping to be considerate.
            She lets out a small laugh{affection >= 1:, her eyes shining}. "I always choose where we go. You should choose this time."
            "Thanks for asking though," she adds after a moment.
            ~affection += 1
            -> options
    }
    * [Head to the movie theater.]
        {getFood: -> transition | -> movieTheater}
    * [Go out and grab a bite to eat.]
        {movieTheater: -> transition | -> getFood }
    + [Head home.]
        -> headHome
    
    = movieTheater
        When you arrive at the theater and approach the ticket window{held_hands and discontentment <= 0:, her fingers still laced with yours}, {charName} asks you what type of movie the two of you should watch.
        {affection >= 1: Usually, {charName} will pick a movie for the two of your to watch, she's a lot more into films than you are. More often than not, she usually picks a crime drama or mystery thriller, so that's always a safe bet.}
        {affection >= 1 and obliviousness <= 0 and discontentment <= 0: Though, you do remember recently that there was this romance movie that she was talking about watching with you. {obliviousness <= -1: When she brought it up though, she did seem to get a bit embarassed by the suggestion and backtracked a bit. You don't think she'd bring it up again, but you know she definitely would want to watch it with you.}}
        {affection >= 1 and obliviousness <= 0 and boldness >= 0: Then again, she does also seem to really like horror movies, even though she's pretty easily scared by them. {affection >= 3 and discontentment <= 0: You do find it pretty cute when she gets scared though, as she almost always subconsciously clings onto you for comfort.}}
                * [A mystery movie.]
                    ~movie_choice = "mystery"
                    You buy two tickets to a newly released mystery movie that you're pretty sure {charName} hasn't seen before.
                    "Just like good old times, eh?" she comments. 
                    -> buySnacks
                    - - (movie1)
                        The two of you sit next to one another in the theater to watch the movie. 
                        {charName} appears to be enjoying the movie greatly, her attention focused solely on the screen.
                        {affection >= 1 and obliviousness <= 1 and discontentment <= 0: Her gaze was full of geniune interest for the entire duration of the film, intensely focused on the plot as new information was revealed. {affection >= 2 and awkwardness <= 0: You actually almost had a hard time paying attention to the movie, as you ended up watching her intense facial expressions nearly the whole time.}}
                    ->options
                * [A romance movie.]
                    ~movie_choice = "romance"
                    {discontentment <= 0: 
                    ~obliviousness -= 1
                    ~affection += 1
                    }
                    -> buySnacks
                    - - (movie2)
                    The two of you settled down in seats next to one another to watch the movie in a near empty theater. {obliviousness  <= -1: The few other people that were there looked like they might have been couples.}
                    {discontentment <= 0 and affection >= 2: As you watched the movie, you found yourself glancing over at {charName} a few times, especially during the most climactic moments of the two main characters' relationship. {obliviousness <= -2: In these moments, you even caught her gaze a few times{awkwardness >= 1 and boldness <= 0:, but you always quickly looked away{boldness <= -1:, your face burning|}}{boldness >= 1:, but she always looked quickly away{obliviousness <= -1:, her facing turning red}}}}. 
                    ->options
                * [A horror movie.]
                    ~movie_choice = "horror"
                    {discontentment <= 0:
                    ~boldness += 1
                    ~affection += 1
                    }
                    -> buySnacks
                    - - (movie3)
                    You both find some seats near the back of the theater, as {charName} requested.
                    {charName} and you watch the movie with interest, even though {boldness >= 2: she ended up getting startled by nearly every jumpsare. |you both ended up getting startled by nearly every jumpscare.}
                    {affection >= 2 and obliviousness <= -1 and discontentment <= 0 and awkwardness <= 1: When she did get frightened, she would lean in towards you, closing in on the small space between the two of you. She would even grab a hold of your arm a few times{awkwardness >= 1:, though she'd always look embarassed and apologize afterwards}.}
                    {boldness >= 2: At some point, you ended up just holding her hand to help comfort her, not letting go until the very end of the movie.}
                    ->options
    = buySnacks
        "Do you want me to buy us some popcorn and candy for the movie?" {charName} asks.
            * "Yes please!"
                "Alright, a large popcorn and some sour candy it is then," she replies with a small smile.
                {movie_choice == "mystery": -> movie1}{movie_choice == "romance": -> movie2}{movie_choice == "horror": -> movie3}
            * "I'm good."
                ~affection -= 1 
                ~awkwardness += 1
                She looks at you a bit taken aback. "Really? Well alright, more for me I guess."
                {movie_choice == "mystery": -> movie1}{movie_choice == "romance": -> movie2}{movie_choice == "horror": -> movie3}
            * [Offer to buy it for the two of you.]
                ~affection += 1
                "What really? Are you sure? I can totally get it for us, its no big deal." {paid_for_food: "Besides, you already bought me dinner!" she adds{affection >= 1 and obliviousness <= -1 and discontentment <= 0:, her face a bit flushed}}.
                "Of course!{affection >= 2 and discontentment <= 0: I love buying things for you."}
                She lets out a small laugh, "Alright, well thank you."
                {movie_choice == "mystery": -> movie1}{movie_choice == "romance": -> movie2}{movie_choice == "horror": -> movie3}
    
    =getFood
        As you approach the shopping center filled with various different shops and resturants, {charName} asks where you should do to get food.
        {affection >= 1: In all honestly, the two of you usually just got fast food when you went out together, and only really went anywhere else on special occasions. Maybe she would appreciate just eating at a usual place.}
        {affection >= 1 and obliviousness <= 0 and discontentment <= 0: Eating at a cafe and getting coffee would also be a good idea though. {charName} is practically obssessed with cafe's and will take any opportunity to go to one.}
        {affection >= 2 and obliviousness <= 1 and discontentment <= 0 and awkwardness <= 0: Though there is this fairly nice resturant that the two of you talked about going to multiple times in the past, and never got a chance to. It might be your last opportunity for a long while.}
            * [Fast food.]
                "Hey how about we just go with fast food?" you ask her, "Thats easy enough."
                "Hm?" She looks over at you{held_hands and discontentment <= 0:, her fingers still laced with yours}. "Oh yeah, sure why not," she replies with a small shrug.
                {awkwardness <= 0 and affection >= 2: 
                "I did kind of wanted to go to that resturent we always talked about but that's fine with me I suppose," she says a bit quietly.
                }
                {held_hands: She lets go of your hand.}{obliviousness <= 0: The look on her face appeared to be one of disappointment, her eyebrows furrowed a bit.}
                "Anyways, let's go," you reply, and the two of you begin walking over to the resturant.
                ~food_choice = "fastFood"
                -> buyFood
            * [A cafe.]
                ~affection += 1
                "How about going to a cafe?{affection >= 1: I know how much you love coffee.}"
                Her eyes light up, "Thats a great idea, actually! Lets go!"
                {held_hands and discontentment <= 0: Next thing you know, she's dragging you quickly along with her, still holding tightly onto your hand. | Next thing you know, shes far ahead of you, already at the entrance to the nearest cafe.}
                {affection >= 2: You can't help but smile to yourself.}
                ~food_choice = "cafe"
                -> buyFood
            * [A nice resturant.]
                {discontentment <= 0:
                ~affection += 1
                ~boldness += 1 
                ~obliviousness -= 1
                }
                "We should go to that resturant that we've always talked about going to," you suggest{affection <= 0 and discontentment <= 0: with a smile}.
                She beams at you{held_hands and discontentment <= 0:, her fingers still laced with yours}. "Really? Oh I've wanted to go there for ages, I'm so glad you suggested it!" she exclaims{held_hands and discontentment <= 0:, tightening her fingers around yours}.
                {held_hands and discontentment <= 0: Next thing you know, she's dragging you quickly along with her, still holding tightly onto your hand. | The two of you start heading over to the resturant.}
                {affection >= 2: You can't help but smile to yourself.}
                ~food_choice = "resturant"
                -> buyFood
                
    =buyFood
    When the two of you arrive, {charName} picks out her order quickly, though you mull it over for a little while.
    {food_choice == "fastFood": She ordered her usual, a cheesburger and fries with the largest possible size of iced tea.{affection >= 2 and awkwardness <= 1 and discontentment <= 0: You can't help but smile at her as she grabs a handful of fries and shovels them into her mouth.} -> continueMeal}{food_choice == "cafe": She ordered a sandwich, alongside a pastry, with two coffee drinks. You can usually only handle one coffee, but she could drink a near endless supply if given the opportunity. {affection >= 2 and awkwardness <= 1 and discontentment <= 0: You can't help but smile at her as she downs an entire large coffee in seconds.}-> continueMeal}{food_choice == "resturant": After the two of you sit down at a table across from one another, she ends up asking the waiter for the biggest order of pasta on the menu.{affection >= 2 and awkwardness <= 1 and discontentment <= 0: You can't help but smile at her as she shovels mouthfuls of steaming pasta into her mouth.}{affection >= 2 and discontentment <= 0 and awkwardness <= 0: -> mealDiversion | -> continueMeal}}
    = continueMeal
    When she goes to pay the bill for your meal, you pause.
        * [Let her pay.]
            She usually was the one to pay anyways, and her job paid more than yours so you knew it wasn't really a bit deal. After the meal is paid for, the two of you head out.
            ~obliviousness += 1
            -> options
        * [Offer to split the bill.]
            You offer to pay for your half of the bill.
            "Oh, thank you. I totally didn't mind paying for both of us though."
            After the meal is paid for, the two of you head out.
            -> options
        * [Pay for the both of you.]
            You offer to pay the bill for the two of you.
            "Oh, thank you, but you really don't need to do that," she says.
            "Oh but I insist."
            {obliviousness <= 1 and discontentment <= 0 and awkwardness <= 1 and affection >= 2: You notice her face get flushed a bit with that previous comment.}
            "Well alright then, I appreciate it."
            After you pay for the meal, the two of you head out.
            ~paid_for_food = true
            {discontentment <= 0:
            ~affection += 1
            }
            ~boldness += 1
            -> options
     =mealDiversion
        She pauses for a moment.
        "Hey, this is a bit... romantic don't you think?" She says teasingly, winking over at you from across the candle-lit table.
            {boldness >= 3: 
            * [Agree.]
            "It... it actually kinda is. I never really thought about it before, but-" you stop in your tracks, realising to what you admitted.
            Looking accross the table, {charName}'s cheeks are bright red as she stares down intensely at her plate. After a moment she seems to brush it off and looks back up at you smiling.
            The two of you continue on with your meal, talking and joking as before, but now it felt like there was an extra bit of tension between the two of you.
            ~obliviousness -= 1 
            ~affection += 1
            -> continueMeal
            }
            * [Jokingly agree.]
            You laugh, "Yeah it is a bit romantic isn't it. {obliviousness >= 1: You'll have to take your future boyfriend on a date here then huh."}
            She laughs back.
            The two of you continue your meal, joking back and forth at one another.
            ~obliviousness += 1
            -> continueMeal
            * [Disagree]
                "What? No, are you kidding me? Don't joke around like that."
                {obliviousness <= 0: A seemingly mortified look flashes accross her face at that comment before she quickly wipes it away.}
                She rubs a hand on the back of her head. "Ah sorry, didn't mean to upset you or anything."
                The two of you continue your meal in silence.
                ~awkwardness += 1 
                ~discontentment += 1
                ~affection -= 1
            -> continueMeal
        
    
    =transition
        The two of you begin to walk together the short distance from the {movieTheater: movie theater}{getFood: resturant} to the {not movieTheater: movie theater}{not getFood: resturant}. {charName} walks slightly in front of you, weaving{affection >= 1: gracefully} through the crowd.
        {obliviousness <= 1 and affection >= 2 and awkwardness <= 1: 
            She holds her hands behind her back, one of which, you notice, is making a sort of coaxing motion towards you. Noticing your gaze, her looks back at you from the corner of her eye, the corner of her mouth upturned in a {obliviousness <= 0: mischevious} grin.
                    {boldness >= 1 and discontentment <= 0:
                    * [Hold her hand.]
                        ~boldness += 1
                        ~affection += 1
                        ~obliviousness -= 1
                        ~held_hands = true
                        You reach forward {boldness <= 1: tentatively} and place your hand in hers. 
                        {affection >= 3: You can't help but notice how soft her hands feel in yours.}
                        She beams at you from over her shoulder, wriggling her eyebrows at you, and grips your hand, lacing your fingers together.
                        She pulls you along with her{affection >= 2:, practically skipping,} as you head to your next destination, hand in hand.
                        {not movieTheater: -> movieTheater}{not getFood: -> getFood}
                    }
                    * [Hand her a piece of gum.]
                        You pull out a piece of gum from the pack in your pocket and reach forwards to place it gently in her upturned palm.
                        She looks a little suprised by this, but then lets out a laugh.
                        She thanks you{obliviousness <= 0:, though it seems that wasn't quite what she was aiming for |.}
                        ~obliviousness += 1
                        {not movieTheater: -> movieTheater}{not getFood: -> getFood}
                    * [Grin back at her.]
                        You make a dumb face and grin back at her.
                        Her eyes widden a bit, but then she lets out a {obliviousness >= 1:hollow} laugh, turning her head to face forwards once again and removing her hands from behind her back.
                        ~obliviousness += 1
                        ~awkwardness += 1
                        {obliviousness <= 1: 
                            There was something about about the look on her face though, that looked just a bit disappointed. Had she wanted something else?
                            {boldness >= 2 and discontentment <= 0:
                            * [Hold her hand.]
                                You reach forwards and wrap your hand around hers.
                                She jumps a bit, suprised by the action, but quickly grips your hand back once she realizes its just you. 
                                {obliviousness >= 0: You notice her cheeks turn just the slightest bit red. }
                                The two of you continue your walk hand in hand.
                                ~held_hands = true
                                ~boldness += 1
                                ~affection += 1
                                ~obliviousness -= 1
                                {not movieTheater: -> movieTheater}{not getFood: -> getFood}
                            }
                            * [What, did she actually want you to hold her hand?  With so many people around?]
                                You think about it a bit. Was she aksing you to hold her hand?
                                No she couldn't have, there were way to many people around, they might start giving you both strange looks if they saw the two of you holding hands.
                                You keep walking, your thoughts a bit jumbled, following her a bit further behind than before.
                                ~discontentment += 1
                                ~affection -= 1
                                {not movieTheater: -> movieTheater}{not getFood: -> getFood}
                            * [Dont worry too much about it.]
                                It was probably nothing. You keep on walking, following close behind her.
                                {not movieTheater: -> movieTheater}{not getFood: -> getFood}
                        }
            -else: 
            You follow close behind her and quickly reach your destination.
            {not movieTheater: -> movieTheater}{not getFood: -> getFood})
            }

    
    =headHome
        {not movieTheater and not getFood: -> hesitate}
        After a short drive, you arrive back at {charName}'s house.
        The two of you lay next to one another on her bed, you scrolling through your phone, and her flipping through pages of a book.
        {affection >= 4 and discontentment <= 0 and awkwardness <= 1: She has her head on your shoulder, the two of you huddled close together. {obliviousness <= -2: Before, you wouldn't have though much of it, the two of you have always been pretty affectionate with one another so this wasn't anything new, but it felt a bit different today.}}
        {affection >= 4  and obliviousness <= 2 and discontentment <= 1 and awkwardness <= 1:
        "Hey {charName}"
        She takes her attention away from her book, placing it down on the bed next to her, and turns towards you, "What is it?"
        {affection >= 6 and discontentment <= 0: With her gaze fixed fully on you, her eyes looked so pretty.}
            {boldness >= 4 and affection >= 6 and awkwardness <= 0 and discontentment <= 0 and obliviousness <= -2 :
            * [Kiss her.]
                You couldn't really help yourself, after everything today, after the thought of her leaving without you getting the chance to do this. Deep down, you realize you wanted to for a really long time.
                You kiss her. And she kisses you back, without hesitation. She too, hand been hoping for this, though she'd been afraid to say anything for the longest time.
                When you pull away, you take a long look at her face.
                "I'll miss you so much," you say breathlessly.
                You see the smallest of tears form in the corner of her eyes, "And I'll miss you even more."
                At least once, you got this chance, before these next few years of you lives apart.
                ~outcome = 1
                * * Continue
                    -> transition_to_secondDialouge
            }
            * "Its nothing... It's just..."
            "I'll really miss you you know."
            She looks at you for a long moment, and in a quiet voice replies, "I'll miss you too."
            {affection >= 4 and awkwardness <= 0: 
            She stares into your eyes for a long moment, her expression nearly unreadable, before she leans over and kisses you. {obliviousness >= 1: Your eyes widden in suprise.}
                {boldness >= 2 and discontentment <= 0:
                * [Kiss her back.]
                You close your eyes and kiss her back, realzing just how much you had wanted to do this for the longest time. Why had it taken the both of you so long?
                When you pull away, you take a long look at her face.
                "I'll miss you so much," you say breathlessly.
                You see the smallest of tears form in the corner of her eyes, "And I'll miss you even more."
                At least once, you got this chance, before these next few years of you lives apart.
                ~outcome = 1
                * * Continue
                    -> transition_to_secondDialouge
                }
                * [Pull away.]
                You pull away from the kiss, and blink at her in suprise. Her eyes widden at you before she starts apologising profusely.
                "I'm so sorry, I don't know what I was thinking! It's just, you're really pretty and I love spending time with you, ugh, I'm messing everything up."
                {discontentment >= 1: 
                "I-I can't believe you... but I though we were just friends?"
                She looks at you, tears welling in her eyes, "I'm so, so sorry. Let's just forget about this."
                But, you weren't sure, this didn't feel right at all. After all you weren't...
                You quickly get up and excuse yourself before you head home.
                ~outcome = 2
                And with that begins the next few years of your lives apart.
                    * * [Continue] 
                    -> transition_to_secondDialouge
                - else:
                "No, no its fine," you say to console her, "I just, really wasn't expecting that at all."
                Despite that she still continues to aplologize. After a while though she stops, and the two of you finally say your goodbyes.
                With that, the next few years of your lives apart have begun.
                ~outcome = 1
                    * * [Continue]
                    -> transition_to_secondDialouge
                }
            - else:
            You spend the next few hours lounging around together, before you head home. You both tell eachother you'll miss one another and say your goodbyes, though it feels like there's something still let unresolved between the two of you.
             And so begins the next few years of your lives apart.
            ~outcome = 2
                * * [Continue]
                -> transition_to_secondDialouge
            }
        - else:
        You spend the next few hours lounging around together, before you head home. {affection >= 3: You both tell eachother you'll miss one another.}
        {discontentment >= 2: Though, thinking about some of today's events however, you feel just a bit uneasy.}
        And so begins the next few years of your lives apart.
        ~outcome = 2
        * * [Continue]
            -> transition_to_secondDialouge
        }
    
    =hesitate
        "We should just head home and chill for the day," you respond.
        She looks over at you, slightly suprised. "What, really? I'm fine with that of course, I just thought that maybe we wanted to do something special today, you know?"
            + "Yeah, I'm sure."
                ~affection -= 1
                ~discontentment += 1
                -> headHome
            + "No, sorry, you're right we should do something fun today."
                {hesitate == 1:
                ~awkwardness += 1
                }
                {charName} smiles at you sheepishly. "Have any suggestions?"
                -> options


// Second Dialouge Tree
=== transition_to_secondDialouge ===
-> DONE

=== secondDialog ===
-> DONE

// Third Dialouge Tree
=== thirdDialog ===
-> DONE

-> END