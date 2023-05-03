// Assignment 4: Narrative Dialog Trees in Ink

// VARIABLES
VAR charName = "Alex"
VAR charName2 = "Mike"
VAR charName3 = "Bella"
// Global Variables - Player Character Stats
VAR obliviousness = 0 
VAR boldness = 0
VAR awkwardness = 0
VAR affection = 0
VAR discontentment = 0
VAR discontentment2 = 0
// Global Variables - Callbacks
VAR driver = true
VAR held_hands = false
VAR movie_choice = "default"
VAR food_choice = "default"
VAR paid_for_food = false
VAR outcome = 0
VAR kissed = false
VAR ready = false
VAR dishes = false
VAR necklace = false


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
                ~kissed = true
                * * [Continue]
                    -> transition_to_secondDialog
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
                ~kissed = true
                * * [Continue]
                    -> transition_to_secondDialog
                }
                * [Pull away.]
                You pull away from the kiss, and blink at her in suprise. Her eyes widden at you before she starts apologising profusely.
                "I'm so sorry, I don't know what I was thinking! It's just, you're really pretty and I love spending time with you, ugh, I'm messing everything up."
                {discontentment >= 1: 
                "I-I can't believe you... but we're just friends aren't we?"
                She looks at you, tears welling in her eyes, "I'm so, so sorry. Let's just forget about this."
                But, you weren't sure, this didn't feel right at all. After all you weren't...
                You quickly get up and excuse yourself before you head home.
                ~kissed = true
                ~outcome = 2
                And with that begins the next few years of your lives apart.
                    * * [Continue] 
                    -> transition_to_secondDialog
                - else:
                "No, no its fine," you say to console her, "I just, really wasn't expecting that at all."
                Despite that she still continues to aplologize. After a while though she stops, and the two of you finally say your goodbyes.
                With that, the next few years of your lives apart have begun.
                ~kissed = true
                ~outcome = 2
                    * * [Continue]
                    -> transition_to_secondDialog
                }
            - else:
            You spend the next few hours lounging around together, before you head home. You both tell eachother you'll miss one another and say your goodbyes, though it feels like there's something still let unresolved between the two of you.
             And so begins the next few years of your lives apart.
            ~outcome = 2
                * * [Continue]
                -> transition_to_secondDialog
            }
        - else:
        You spend the next few hours lounging around together, before you head home. {affection >= 3: You both tell eachother you'll miss one another.}
        {discontentment >= 2: Though, thinking about some of today's events however, you feel just a bit uneasy.}
        And so begins the next few years of your lives apart.
        ~outcome = 2
        * * [Continue]
            -> transition_to_secondDialog
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
=== transition_to_secondDialog ===
10 Years Later
    * [Continue]
    -> secondDialog

=== secondDialog ===
The next 10 years of your life went by quickly, far more so than you would have expected. You went to college for four years, and graduated with a degree without much of a problem.
{outcome == 1: You and {charName} kept in contact with one another throughout the first few years of college. You both talked about making trips to see one another, but in the end, neither of you were really able to. She got caught up with school pretty quickly, it was highly competetive there, and eventually the two of you ended up drifting apart, not contacting one another much at all. | After {charName} left, the two of you didn't really end up keeping in tough with one another all too much, things between you left off in a bit of an awkward state after all. And you both were really far to busy with school to ever contact one another. You did consider reaching out a few time, but something always ended up stopping you.}
You ended up meeting this guy, {charName2}, you really got along with in your second year of college, and the two of you ended up dating for a long while. After college, the two of you ended up moving in together. You were compatable with one another, and he was one of the sweetest men that you'd ever met at the time. Naturally, after two years of living together, you ended up getting married. 
    * [Continue]
        Both of you wre able to land yourselves with fairly paying jobs after graduating, so you ended up being able to buy a nice enough house for the two of you to live in, and raise a family.
        And now, the two of you even have a daughter, {charName3}. She turned four not too long ago, and raising her alongside your husband has made you incredibly happy. 
        Though recently, it started to become a bit tense between you and {charName2}. Ever since your daughter was born, he's been a bit more irritable and disconnected from you, which makes sense of course, raising a child isn't an easy thing, but doesn't really help that the two of you have been in a lot more arguments than usual. The stress of his old job ended up getting to him, so he ended up quitting and working part-time from home, while you've still kept your old job. You figure something about you now being the primary provider for the household is offputting for him - many of your arguments tend to be about about finances and career choices.
        Now, you stand in front of your bathroom mirror. You'd made plans to go out to dinner tonight, so you were finishing up getting ready.
        {charName2} is sitting on the couch in the other room.
        "Hey, are you heading out somewhere tonight?", he asks you.
            * * "Yes, I told you about this already."
            ~discontentment2 += 1
            You sigh and poke your head out of the door to glare at him from accross the room, "It's not like I made these plans today. I've already told you about this multiple times."
            He glances over at you, before returning his gaze to the TV. "Well you can't really blame me for forgetting, you're so busy all of the time, its hard to keep track. Remind me again, will you?"
            -> eveningPlans
            * * "Ah, yeah I made plans for tonight."
            You'd already told him about this several times, but you really couldn't be bothered to call him out for forgetting.
            He glances over at you from accross the room, before returning his gaze to the TV. "Care to tell me where you're going? I was kind of counting on you to help make dinner tonight."
            ->eveningPlans
            
    = eveningPlans
    A few weeks ago, while you were out grocery shopping, you ran into {charName}. You hadn't seen her for so long, you honestly couldn't even believe it at first. {affection >= 4 and discontentment <= 1: She's looked so much different than you'd last seen her. It had been 10 years, but you really hadn't expected her to change all that much. She looked so much more mature, not just in apperance but in her whole demeanor too. {boldness >= 3 and obliviousness <= 1 and kissed: You mostly just noticed how she looked even more beautiful than she had before.}}  
    She'd been traveling around the country for a while and was planning on settling down here for a few weeks. The two of you ended up making plans to go out to dinner over the weekend to catch up.
    You think of how to answer {charName2}'s question.
        {affection >= 2: 
        * "I made plans with my old friend from high school."
        "Really? Who is it?" he asks.
        "That girl I was best friends with in high school, {charName}."
        "Who?" 
        {outcome == 1: 
        "Come on, I've told you about her before," you say with a sigh, "I used to hang out with her all the time before she went off to University."
        He shrugs, "I guess maybe I remember you talking about her, I don't know." 
        You sigh again, "Well I ran into her recently, so we're going out to dinner to catch up a bit since its been so long."
        "Well all right then, don't stay out too long."
        ~discontentment2 += 1
        - else:
        "Huh, I guess I never really talk about her much..." you say, thinking back on it.
        "Well we were super close for a long time, but we haven't really talked at all for a while, so we're going out to dinner tonight to catch up a bit.
        {charName2} shrugs before returning his attention fully to the TV, "Well alright then, don't stay out too long."
        }
        -> beforeLeaving
        }
        * "Just going out to dinner to catch up with someone I knew from high school."
            ~affection -= 1
            ~discontentment += 1
            "Really? Who is it?" he asks.
            "Just some girl I had classes with in high school. I ran into her a few days ago, and we talked about catching up, so we'r emeeting over dinner."
            {charName2} lets out a hmph in acknowedgment, his attention returning fully to the TV now. {obliviousness <= 0: You swear you saw him look a bit relieved when you mentioned that it was a girl you had plans with. {discontentment >= 1 and awkwardness <= 1: You try to brush it off, but something about that look just rubs you the wrong way.}}
            -> beforeLeaving
        
    = beforeLeaving
    Before you head out to dinner, you survey the space a bit, wondering if there's anything that you forgot.
        - (top)
            + + {ready} [Head out.]
                {not daughterInterrupts: -> daughterInterrupts | You give {charName3} a kiss on the head and ruffle her hair before heading out the front door. -> transition_to_thirdDialog}
            * [Grab your wallet {driver: and car keys.}]
                Before you're ready to leave you make sure to grab you wallet{driver: and car keys}.
                ~ready = true
                -> top
            * [Check the bookshevles.]
                You take a glance at the bookshelves in your living room. They're mostly filled with movies and video games that {charName2} bought, but there's also quite a few books of all different genre, most of them yours. {affection >= 3: A lot of those books, you realize, are ones that {charName} reccomended to you throughout the years, mostly a lot of mystery books, but also quite a few fantasy ones. {outcome == 1: The same goes for the movie collection, a lot of the ones that you picked out were actually just reccomendations from {charName} too {awkwardness >= 1:, though you didn't really end up watching many of them.}}}
                {affection >= 3 and outcome == 1 and movie_choice != "default": In those rows of yours and your husband's movie collection, you also see one that you bought. It was the {movie_choice} movie that you and {charName} saw at the theater the last time that you saw eachother. You remember buying a copy of it as soon as the DVD released.}
                -> top
            * [Check the kitchen.]
                Just to make sure you didn't end up leaving a mess around the kitchen, or leave anything around that {charName3} might reach, you go to double check. 
                Though you'd sworn you cleaned it earlier, there were several dirty pans still on the stove, and dishes in the sink. You don't really have time to deal with the mess now, but-
                    * * {boldness >= 2} "Hey {charName2}, can you please come in here and deal with these dishes while I'm gone?"
                    "I'm a little busy at the moment, can't you just deal with it?" he yells from the other room.
                    You shake your head to yourself, "In case you forgot, I have to leave in a minute here! I would appreciate if they at least got done before I'm back."
                    He lets out a loud sigh, "Yeah, yeah, I'll get to it eventually."
                    {discontentment2 >= 1: He says that, but you really doubt it will get done at all. Its not something he did very often.}
                    ~boldness += 1
                    ~discontentment2 += 1
                    ~dishes = true
                    -> top
                    * * "I guess I'll have to deal with it when I get home."
                        You don't have the time to do the dishes now, and you wouldn't want to burden {charName2} with dealing with it, so you decide for now you'll just have to do it when you get back from dinner.
                        ~boldness -= 1
                    -> top
            * [Check your jewelry box.]
                You think about maybe putting on some extra jewelry before you head out. {affection >= 4 and awkwardness <= 1 and kissed and outcome == 1: After all, you wan't to look as nice as possible if you're going out to dinner tonight.}
                - (top2)
                {necklace: Should you wear anything else?}
                    * * {affection >= 4 and boldness >= 2 and awkwardness <= 0 and outcome == 1} [Consider the necklace that {charName} got you.]
                        You can't help but notice the necklace you still have that {charName} had bought you not too long after the two of you became friends. You wore it nearly every day after that, but after a while, you ended up just stashing it away. {kissed: For some reason, you just couldn't bear the thought of getting rid of it.}
                        * * * [Wear it.]
                        ~affection += 1
                        ~boldness += 1
                        ~necklace = true
                        You decide to wear it. You wonder if she will still recognize it.
                        -> top2
                        * * * [Don't wear it.]
                        ~awkwardness += 1
                        It might feel a little weird if you were to wear the necklace, especially since its been so long since the two of you really talked at all.
                        -> top2
                    * *  [Wear a few rings.]
                    You pick out a few different rings from your jewelry box and put them on. You spread out your fingers in front of your face a bit to admire them.
                     -> top
                    * * {not necklace} [Wear a necklace.]
                    You pick out a necklace from your jewery box and reach around your head to clip it on. {discontentment2 >= 2 or dishes: You would ask {charName2} to help you, but he doesn't really seem to be in a agreeable mood today.}
                        -> top
                    * * [Decide against it.]
                    {not necklace: 
                    You think about if for a bit more, before deciding against it. It might feel a bit too formal if you put on any jewelry.
                    ~obliviousness +=  1 
                    ~boldness -= 1
                        -> top
                    - else:
                    No, just the necklace is enough.
                    -> top
                    }
        
    = daughterInterrupts
    As you start heading out to leave for the evening, you see your daughter waddle out from her room into the living room, rubbing at her eye with one hand, the other grasping onto a crayon.
    "Mommy?" she asks looking up at you with sleepy eyes. "Where are you going?"
    You crouch down and ruffle her curly hair. Giving her a big smile, you reply, "Mommy's going out to dinner {affection >= 2 and outcome == 1: a friend }tonight. I'll be back in just a little bit, don't you worry."
    She pouts at you, "But I don t want you to leave!"
    When she said it like that, it did hurt your heart a bit. You already hated the fact that you couldn't spend every waking moment with her.
        - (top3)
        * "Hey, how about you go back to your room and color some more?"
        "I'll be back home before you know it," you say with a smile.
        ~obliviousness += 1 
        You didn't really know what else to tell her. You thought that might keep her entertained for a bit before she fell asleep.
        She sniffles a bit, still pouting, "But I'm done coloring..."
        You'll have to find some other way to comfort her you suppose.
        -> top3
        * "How about you play with dad while I'm gone?"
            "I'm sure he'd love to play a game with you."
            You glance over at you husband still sitting on the couch. He still seems distracted.
            "Hey {charName2}, can you hang out with {charName3} while I'm gone? You guys can put together a puzzle or something."
            He finally looks over at you, "Hm? Oh, uh, sure I can do that in a bit."
            {discontentment2 >= 2:  He was usually pretty good at handling your daughter, but everything thats been going on between the two of you recently has left you a little bit doubtful towards him. He's certainly trying his best, but, you don't know, something just felt a bit off, like he wasn't as engaged as he usually was. | You let out a sigh of relief.}
            You return your gaze back to your daughter, though she still looks a bit troubled. You reassure her, "I'll be back to tuck you into bed, I promise."
            She lets out a quiet, "Okay."
            -> beforeLeaving.top
        * "I'm sure dad will make you some dinner soon."
            You glance over at you husband still sitting on the couch. He still seems distracted.
            "Hey {charName2}, can you handle making dinner for the two of you tonigh? {obliviousness <= 2 and discontentment2 >= 1: There's still some leftovers from last night in the fridge that you can heat up if that's too much to deal with right now."}
            He finally looks over at you and sighs, "Yeah sure I can do that in a bit.{obliviousness <= 2 and discontentment2 >= 1: I swear, its like you think I'm incapable.}"
            {discontentment2 >= 2:  He was usually pretty good at handling your daughter, but everything thats been going on between the two of you recently has left you a little bit doubtful towards him. He's certainly trying his best, but, you don't know, something just felt a bit off, like he wasn't as engaged as he usually was. | You let out a sigh of relief.}
            You return your gaze back to your daughter, though she still looks a bit troubled. You reassure her, "I'll be back to tuck you into bed, I promise."
            She lets out a quiet, "Okay."
            ->beforeLeaving.top



// Third Dialouge Tree
=== transition_to_thirdDialog ===
{discontentment2 >= 1: 
You lock the door behind you, letting out a sigh and rubbing your shoulder. You've been feeling a bit more stressed out than usual lately. You can't help but worry about {charName3}, you know how often she cries when you're not home, especially since {charName2} always feels the need to bring it up. {affection >= 4 and awkwardness <= 1 and outcome == 1: You really are looking forwards to catching up with {charName} tonight, though, especially since its been so long, so hopefully that will help you to relax and wind down for the evening. | You are a bit worried about meeting up with {charName} tonight too, since you two didn't leave everything off all that well the last time you saw one another. {discontentment >= 1: Especially, with what happened.} But you're hoping that it will at least be fun chatting with her again since its been so long.}
- else : 
You lock the doors behind you, letting out a sigh. You're a bit worried about {charName3}, you know how sad she often gets when you leave home. {affection >= 4 and awkwardness <= 1 and outcome == 1: You really are looking forwards to catching up with {charName} tonight, though, especially since its been so long,  so hopefully that will help you to relax and wind down for the evening. | You are a bit worried about meeting up with {charName} tonight too, since you two didn't leave everything off all that well the last time you saw one another. {discontentment >= 1: Especially, with what happened.} But you're hoping that it will at least be fun chatting with her again since its been so long.}
}
{driver: You get into your car and start driving to the resturant the two of you agreed to meet up at. | You call a taxi to drive you to the resturant that the two of you agreed to meet up at.}
* [Continue]
    10 Minutes Later
    * * [Continue]
        -> thirdDialog

=== thirdDialog ===
{secondDialog.top >= 5: When {driver:you arrive|your taxi arrives} at the restuarnt that you and {charName} agreed to meet at, you see her already sitting by a bench at the front entrance. |  When {driver:you arrive|your taxi arrives} at the restuarnt that you and {charName} agreed to meet at, you look around, but dont see her anywhere. After looking around for a few minutes, and as you're about to check your phone for any messages, you see her walk up.}
When your eyes meet, {charName} smiles at you, "Glad to see you made it."
{affection >= 3 and awkwardness <= 1 and discontentment <= 0 and obliviousness <= 2: Though you did just see her a few days ago, you couldn't help but notice how nice and well put together she looked, wearing a nice black button-up with her hair tied up. Of course, it had been ten years, but she really did look so more more mature, though you suppose you must have too. {affection >= 5 and kissed and outcome == 1: Though that gleam in her eyes remained just as bright as it did before, with an extra sense of sharpness to them.}}
{necklace and obliviousness <= 1: She looks down at the necklace around your throat, noticing it almost immediately. {awkwardness >= 1: You tense up a bit, starting to feel a bit weird for deciding to wear it after all.} For a moment, you think she might say something, but she looks away without mentioning it. {obliviousness <= 0: What you do notice however, is the way that she smiles quietly to herself when she turns away, her eyes closing for just a moment in rememberance. {kissed: You mind races for a second, wonder what it is she might be thinking about.}}}
"So, should we head on in then?" she asks.
    * "Yes, lets."
        -> conversation
    

    = conversation
        {affection >= 4 and boldness <= 4 and awkwardness <= 2: She opens the door, letting you walk inside first.}{affection >= 4 and boldness >= 5 and awkwardness <= 1 and discontentment <= 0: You reach around her and open the door, letting her walk in inside before you. She tips her head at you in thanks, showing her teeth in a sideways grin as she walks past.}
        When the two of you enter, you are quickly seated at a table accross from one another. {food_choice == "resturant" and affection >= 3 and outcome == 1: You think back to the last day that you had seen her, remebering how the two of you had sat accross from one another just like this. {kissed: But remembering that also reminds you of what other things that transpired that same day.}}
        After the waiter takes both of your orders, {charName}{food_choice == "resturant" :, of course,} ordering the pasta, the two of you are finally alone to talk after so many years.
        - (top)
            * [Ask her how she's been doing lately.]
                Going with a simple question{top == 1: first}, you ask her how she's been.
                She chuckles. "I've been doing pretty well actually. I've been doing a lot of travelling for the past few years, since graduating university really."
                She laces her fingers together on the table in front of her. "It's been nice being able to see new places, never really having to get stuck in one place for to long," she says, looking down at her hands.
                She looks up, shaking her head to herself as if she had been lost in thought for a moment, and smiles at you. "Well how about you, how have you been?"
                    - - (top2)
                    {top2 >= 2: {charName} looks towards you with interest, propping her head up with a first. "Tell me more," she prompts with a small smile.}
                    * * [Talk about your daughter.]
                    -  - - (top3)
                    "I actually have a four year old daughter at home, {charName3}. She occupies most of my time when I'm lucky enough to not be at work." 
                    You smile to yourself, "I never really imagined I'd ever have a daughter, but she really is amazing. She's got this beautiful curly hair and she's really smart."
                    {affection >= 4 and obliviousness <= 1 and awkwardness <= 1: When you glance across the table at {charName}, she looks likes she's in awe.}
                    "Wow, that's really amazing."
                    {affection >= 4 and awkwardness <= 1 and obliviousness <= 1: I bet she's a lot like her mom, then," she adds with a wink.}
                            * * * {boldness >= 3} "Do you have any kids?"
                                "Oh, ah, no I don't. Guess I haven't really had time to settle down and raise a kid."
                                She laughs sheepishly.
                                You wonder if you shouldn't have asked.
                                {affection >= 6 and awkwardness <= 0 and kissed: 
                                But, before you try and change the subject, she adds quietly, "If I were to have a kid though, I'd probably want one like yours... And, uh, someone to raise them with. Someone that I'm really compatable with."
                                She clears her throat before continuing the conversation.
                                ~obliviousness -= 1
                                } 
                                -> top2
                            * * * [Continue the conversation.]
                                You think about asking her if she has any kids of her own for a moment, but decide against it. You wouldn't want to risk making her uncomfortable.
                                -> top2
                    * * [Talk about your husband.]
                    "I met this guy in University, actually. We dated for a few years and then got married a year before our daughter was born. We've been living in this town for a while now. Its not all to far from where me and him grew up, so {charName3} has the opportunity gets to see her grandparents from time to time."
                    {affection >= 6 and awkwardness <= 0 and obliviousness >= -1: Her eyes flash for the briefest of moments.}
                    "Tell me about him."
                        * * * {discontentment2 >= 1 and boldness >= 2 and awkwardness <= 1} [Vent a bit.]
                            "Well he was super amazing when we first dated, and for a while after we got married. But well, you know how it goes. It does get tough after a while, especially when you bring a child into the relationship. He doesnt really engage as much as he used to to be completely honest. Sometimes I'm not really sure, but I guess we'll have to work though it."
                            "Ah, yeah I get it," she says, giving you a sympathetic look.
                                * * * * {boldness >= 2 and affection >= 4 and awkwardness <= 1 and awkwardness <= 1} [Ask her about her relationships.]
                                -> relationships
                                * * * * [Continue the conversation.]
                                You think about asking her if she's in any relationships, or has been since you saw her last, but you decide against it. {awkwardness >= 2: Besides it felt a bit weird to ask.}
                                -> top2
                        * * * [Give her some vauge details.]
                        You tell her a bit about {charName2}, about what he studies in University, and how the two of you met. You talk about his personality a bit, but you choose to leave out how weird its been between the two of you. 
                        {charName} listens intently, only interrupting to ask a couple questions{obliviousness <= 0:, but you can't help but sense a bit of hesitation from her}.
                                * * * * {boldness >= 2 and affection >= 4 and awkwardness <= 1} [Ask her about her relationships.]
                                -> relationships
                                
                                * * * * [Continue the conversation.]
                                You think about asking her if she's in any relationships, or has been since you saw her last, but you decide against it. {awkwardness >= 2: Besides it felt a bit weird to ask.}
                                -> top2
                        -> top2
                        * * * [Dodge the question.]
                            You don't know why, but you don't really feel like talking much about him right now. {discontentment2 >= 2: Maybe its just because of how weird and disconnected it feels between you and him now, but you weren't sure.}{affection >= 4 and boldness >= 2 and outcome == 1: Besides, something about talking about your current relationship with her seemed a bit... wrong.}
                            "Oh you know, he's a pretty good dad and all. I'm just grateful he's the reason I have {charName3}," you say with a bit of an awkward laugh.
                            {charName} laughs back{affection >= 4 and kissed and obliviousness <= 1:, sounding almost a bit relieved}.
                                * * * * {boldness >= 2 and affection >= 4 and awkwardness <= 1} [Ask her about her relationships.]
                                -> relationships
                                * * * * [Continue the conversation.]
                                You think about asking her if she's in any relationships, or has been since you saw her last, but you decide against it. {awkwardness >= 2: Besides it felt a bit weird to ask.}
                                -> top2
                        -> top2
                    * * [Talk about your job.]
                    You talk about your job for a bit, mostly about how time consuming it is and how it takes away from spending time with your daughetr. You do enjoy it of course, and it helps to provide {charName3} with stability, but you do wish you could be at home more. {discontentment2 >= 1: You do express you jelousy about how your husband works at home, and gets to see her more often when she isn't off at pre-school.}
                    {charName} listens to you talk with interest, sympathizing with your desire to have some time of to spend with {charName3}.
                         * * * {boldness >= 2 and awkwardness <= 1} [Ask her how's she's been making a living.]
                         "Oh actually, I work remotely, and the job's consistent enough on giving me projects they want done, but it still gives me enough time to travel around a bit. I guess not really having a spouse or kid gives me some extra free time, huh."
                         {affection >= 5 and awkwardness <= 1 and obliviousness <= 0: She pauses for a minute, "Though it would be nice to settle down somehwere with someone. For now though, I suppose I'm content with how everything's going.}
                         {outcome == 1 and affection >= 5 and awkwardness <= 1 and obliviousness <= 0: You consider her words for a while, about how she's content with how things are. But you wonder for a moment if she's really happy, or if she does want something more.}
                        -> top2
                         * * * [Continue the conversation.]
                         You could ask her about her work situation, but since you know she travels a lot, you wonder if it might be a sensitive topic.
                        -> top2
                    * * {top2 >= 2} [Enough about me.]
                    "Enough about me, I want to know what else you've been up to."
                    She removes her head from her hand, sitting back upright and leaning back in her chair slightly. "Ask away," she says, her eyes bright.
                        -> top
                        
                - - - (relationships)
                "What about you? What's your experience with relationships."
                She chuckles a bit nervously, shifting in her chair a bit.
                {kissed: 
                "Well I did date a couple of women in college, though to be honest none of them were all that serious, mostly just causual. I did have a girlfriend that lasted for almost a year, but, I don't know, I guess I just haven't really found my person to settle down with like you have yet." {affection >= 6 and obliviousness <= 0: She searches you eyes for a moment, looking for some sort of reaction.}
                - else:
                "I did date a guy my first year of college," she pauses for a moment, seemingly hesitant to continue, before she sighs and continues.
                "But I quickly figured out that I wasn't really into men at all. I do feel bad for him though, he was nice enough, I just didn't really like him the way he liked me."
                You raise your eyebrows.
                "But anyways," she says with a small nervous chuckle, "I actally dated a few women after that. Though to be honest none of them were all that serious, mostly just causual, but they definitely felt more right than before. I did have a girlfriend that lasted for almost a year, but, I don't know, I guess I just haven't really found my person to settle down with like you have yet."
                }
                {discontentment2 >= 2: Something about that last comment she said made you pause. You were married after all, so you guess she wasn't wrong, but still.}
                "Well I'm sure you will," you reassure her.
                She looks down and smiles, "Thank you."
                "Are you suprised?"
                "Hm?" You stare over at her, a bit confused.
                "Well I dont know," she laughs, "I mean I never really talked about this kind of thing with you back in high school."
                    * * *  {obliviousness <= 0 and discontentment <= 0} ["Not really, no."]
                    "To be completely honest, I'm not really suprised," you say with a laugh.
                    She smiles, "I suppose I was a bit obvious."
                    -> top2
                    * * * ["A bit, yeah."]
                    "I guess I am a bit suprised, yeah. But, thanks for being open to telling me about it."
                    {obliviousness >= 2: You really didn't think she was interested in women, but I guess you were proven wrong.}
                    {discontentment <= 2: It certainly made you re-evaluate your past friendship with her just a bit, wondering if you have ever led her on.}
                    "Really?" she says a bit shocked. "I totally thought I was pretty obvious, haha."
                    ~obliviousness += 1
                    -> top2
                
            * {boldness >= 1 and top2} [Ask her about how long she's here for.]
            "Ah, just a couple weeks. I visited back home not too long ago - haven't seen my parents for a while - but I traveled out here to see what its like. Its always nice to see what its like in smaller towns like these."
            {outcome == 1 and affection >= 4 and awkwardness <= 1 and obliviousness <= 0: "I was hoping that you might have still been around our hometown, but I'm lucky enough to have had the chance to run into you here," she says with a smile.}
            -> top
            * [Ask her about what her plans are while she's here.]
            "I'll probably just hang around for a bit. Might get some projects done while I'm here - there's quite a few nice cafe's around town that I want to try."
            -> top
            * [Ask her where she's been staying.]
            "I'm staying in a hotel a bit of a ways outside of town actually. Though, I did find a nice little inn that is a bit closer, so I might try and stay there for a while instead."
            -> top
            * {top >= 4} [Get ready to leave.]
            After the two of you finish talking, the waiter comes to give you the check for the meal.
            {paid_for_food and affection >= 4 and outcome == 1:  
            You reach for the check, but as you do, {charName} snatches it up before you have the chance to, "Nuh uh, I invited you out to dinner tonight, so let me be the one to pay."
            You try to argue, but she shushes you with a smile. {affection >= 5 and awkwardness <= 1: You can't help but laugh a bit before thanking her.}
            - else:
            You both  agree to split the check equally between the two of you{affection >= 4 and outcome == 1:, though {charName} tries to pay for the both of you ar first.}
            }
            -> driveHome
        
= driveHome
{driver: 
As the two of you walk outside the resturant, and you start heading towards your car, you notice {charName} just standing near the entrance on her phone. You wonder if she's calling for a ride.
"Hey, {charName}!"
She looks up from her phone over to you, "What's up?"
"Do you need I ride back to your hotel? I can drive you there, its no problem."
"Are you sure thats okay? I'm sure you want to get home soon."
"No really, its fine," you say with a smile. {affection >= 3 and discontentment <= 0: Just like old times, you thought.}
"Well, thank you," she says gratefully, before walking with you to your car.
- else:
As you walk outside of the resturant, you pull up your phone, ready to call a taxi to get back home. {charName} stops in her tracks.
"Hey do you need a ride home?" she asks you.
"Oh, no, I wouln't want to trouble you."
She laughs, "Don't worry, its no trouble. {affection >= 4: Besides, I wouldnt want you to have to wait out in the cold when you probably want to get home as soon as possible.}"
"Well, alright then, thank you very much."
}
The two of yor reach the car{affection >= 3 and awkwardness <= 1: {driver:, you opening the passenger door for {charName}}{not driver:, {charName} opening the passenger door for you to climb inside}|{driver:, {charName} climbing into the passengers seat}{not driver:, you climbing into the passenger's seat}}.
{affection >= 5 and awkwardness <= 1 and discontentment <= 0: The two of you continue to chat for the whole drive back.}
    * [Continue]
    {driver: 20 Minutes Later | 10 Minutes Later}
    * * [Continue]
    -> finalScene
    
= finalScene
{driver: As you arrive at {charName}'s hotel, she thanks you, and then gets out of the car. As she starts walking away, waving back at you as she goes, you hesitate.}
{not driver: As {charName} arrives at your house, parking a little ways down the street, you thank her, and get out of the car. As you're about to walk back to your house, you hesitate.}
    * {affection >= 5 and boldness >= 3 and awkwardness <= 1 and discontentment <= 0} "Wait, I need to tell you something."
    There was something that was bothering you, you couldn't just leave things like this, with the two of you parting ways again. You were worried that it would just end up the same way. The two of you had been so close, for you to not take the chance to try and rekindle that friendship.. you just couldn't bear the thought of it.
    {kissed: And though you hated yourself for it, you really couldn't stop thinking about that last day you say eachother, when the two of you kissed. That moment had been running through your mind the entire night.}
    {driver: You climb out of your car, leaving it still running and walk, nearly run, over to her. {charName} turns around, looking at you, her eyes wide.}{not driver: You turn swiftly around, and walk, nearly run back over to where she sits in the driver's seat of her car. She climbs out of the car, leaving it still running, looking at you with her eyes wide.}
            * * {affection >= 6 and boldness >= 4 and obliviousness <= 0}"I don't want this to be the end."
            She looks at you, searching your eyes, her expression serious and solemn.
            You say it again. "I don't want this to be the last time we see eachother. I don't want us to end the same way we did last time." Your voice was trembling.
            She's still looking at you, staring into your eyes, her own shining, on the verge of tears.
            "I dont want that either," she says, her voice hushed.
            You continue to look into one another's eyes.
            "Then we won't let it be," you say, "we'll see eacother again. We'll talk more."
            You stop for a moment before you continue, "I really couldn't bear it you know? Not being friends with you, being so distant from one another. {kissed: Especially with all that happened between us.} I want us to be close like we were before."
            {charName} just continues staring at you, an expression of awe on her face.
            "I won't let that happen again, I promise you," she says breathlessly.
            "Don't leave in just a few weeks, please stay here a while longer."
            "I promise."
                * * * [Hug her.]
                The two of you close that small distance between each other and embrace. She buries her head in your shoulder, tugging you in close. All those years spent apart seem to melt away just like that.
                There may be a future in store between the two of you after all.
                -> END
            * * "We should meet up again before you leave."
            She looks down and smiles, "We definitely should." {obliviousness <= -1: Though you could hint a twinge of sadness in her voice.}
            "How about tomorrow? We could go get coffee after I get off work? {awkwardness <= 0: Or you could even come over and meet my daughter if you wanted to.}
            "Sounds like a plan."
            "See you again tomorrow then."
            "See you."
            {driver: She continues walking until she's back inside of the building. You stand there for a moment, your car's motor still rumbling behind you. | You continue walking until her car is far out of sight, nearing your fron door.}
            There was still so much left between the two of you. You could feel it hang heavy in the air. Would it really be that simple? You'll see eachother a few times over the next few weeks and you'll be best friends again? You hope so, you really do, but you weren't sure.
             You wonder if, after these next few weeks, after she leaves again, you will ever see her again.
            -> END
            * * "Take care, will you?"
            She smiles at you, her expression a bit sad. "I will."
            {obliviousness <= -1: You could tell that she wanted you to say something else, but, something stopped you. You were afraid.}
            {driver: She starts walking away again. | You turn and continue walking away.}
            "You take care too, yeah?" she says quietly.
            {driver: She continues walking until she's back inside of the building. You stand there, a bit speechless, your car's motor still rumbling behind you. | You continue walking until her car is far out of sight. You realizd you ended up walking right past your house.}
            There was still so much left between the two of you. You could feel it hang heavy in the air.
             You wonder if you will ever see her again.
            -> END
    * [Let her go.]
        You think about saying something, about trying to re-kindle your freindship with her after all these years, but, something stops you.
        You're afraid. Afraid of opening up that relationship again. Afraid of what will happen.
        {discontentment >= 1 or outcome == 2: Besides, there's something about the way that things ended between you all those years ago that makes you a bit hesitant.}
        {affection >= 6 and discontentment <= 0 and outcome == 1: But most of all, you're afraid of losing her again. But you just can't get yourself to tell her that. Can't get yourself to say those words aloud.}
        {driver: As you watch her walk away, you wonder if you'll ever see her again.}{not driver: As you walk back to your home, your husband and daughter waiting for you inside, you still can't stop yourself from wondering if you'll ever see {charName} again.}
        -> END