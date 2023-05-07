// CMPM 148 - Assignment 5: Time Loop Game


// CHARACTER NAMES (listed as variables so they can be easily changed)
VAR protag = "Kiran"
VAR protagNickname = "Kir"
VAR char1 = "Rivin"
VAR char1bird = "Crowly"
VAR char2 = "Aeula"

// VARIABLES
LIST knowledge = bird, monsterLocation, lostWeapon, job1Failed, job2Failed
VAR has_weapon = false
VAR failed_loops = 0
VAR previous_death = "default"
VAR checking_char2_ranking = false
VAR actions_this_loop = 0


// STORY CONTENT
~knowledge = ()
-> Begining

=== Begining ===
-> wakeUp

= wakeUp
~actions_this_loop = 0
// monolouge for first time loop (story set up and junk)
When you awaken, still bleary eyed, you are met with the sight of the half-rotted wooden ceiling of the inn that you'd spent the night in, sunlight staring to stream in from the windows. You sit up in the creaking bed, you head still pounding from the night before. Yeah, you might have went just a bit overboard. You don't really remember anything that happened last night other than the fact that you definitely spent all of the money you had gotten from that last job you did. Already. And probably then some.
You try to rub the sleep out of your eyes and roll out of bed with a groan. You stand up for a moment, waiting for the pain in your head to subside. You stand there, just staring at the wall, swaying slightly, eyes half closed with a blank expression on your face. When you think you've mustered enough strength, you take a step. But you're immediately met with the hard wooden floor as your legs give out from under you.
"Well shit," you mutter under your breath, the sound muffled by your face pressed against the floor.
    + [Come on, get up.]
    {wakeUp == 1: -> introMonolouge | -> END}
    - (introMonolouge)
    With a bit of a struggle, you use all of the strength in your arms to get yourself back up on two feet. Your head is still spinning but you manage to stand upright this time. 
    You laugh quietly to yourself, but wince at the sharp pain in your head. Some assassin you were.
    Yup, believe it or not, you were actually an assassin working at the local Assassin's Guild in this town. Actually, the entire town WAS the whole guild more or less. You can't imagine there were actually any sane people that lived here given the types of people that roamed these streets. It was called an Assassin's Guild, but, really, it consisted of just about anyone and everyone who made a living by killing, human or otherwise: bounty hunters, executioners, hit-men, you name it.
    Anyways, you'd love to just lie back down and go to sleep, but you figure you ought to get out and find a new job. You needed the money, that was for sure, especially since this was probably the fourth time you crashed at this inn without having the money to pay for it. The innkeeper was nice enough to only threaten to kill you every time you left without paying, but your tab was steadily growing. If it happened again, those threats would probably stop being threats. You figured now was about time you actually paid them back.
        + + [Start heading out.]
        As you head down the stairs, still feeling a bit groggy, to the first floor, you hear someone yell out your name.
        "{protag}!"
        You freeze in place, and reach up to press on your ears, the loud yelling making your head pound even more than it already was. "Wh-what?"
        Suddenly, you see a flash of light, and your eyes widden as a sharp object flies right past your face, embedding itself into the wall right next to you. You slowly turn your head to see a knife, its handle still quivering, lodged into the wall right next to your head.
        You stumble backwards in shock, falling back onto the ground. You reach up to feel your face to find a shallow cut running along your cheek. When you remove your hand, you find your fingers covered in a thin layer of blood.
        You turn your head swiftly over to the front desk, enraged, "Hey! What the hell!"
        The innkeeper stands behind their desk, hand still extended, pointing an accusatory finger at you. They glare in your direction. "If you're gunna keep staying here, you better pay! This place isn't free you know!"
        "Yeah, yeah, I know jeez!" you shout back, wiping the blood off of your face withof the back a sleeve. You were certainly more awake now.
        "Next time I wont miss!"
        Standing back up and brushing yourself off, you reply under your breath, "Well then I couldn't exactly pay you back then could I?"
        They just glare at you, their eyes following you as you walk out the front door back into the town.
         + + + [Head out to the center of town.]
        -> townCenter
        
    = townCenter
    You find yourself standing out in the center of town. You stretch out your limbs, still a bit stiff from sleeping on that rock hard bed. Looking around you see its as busy as usual, even this early in the morning. There are several different shops lined up around the square, most of which were either selling weapons, armor, poisons, and a variety of other different tools of destruction. Of the surrounding buildings, they mostly consisted of taverns and gambling dens, a few blacksmiths, and even a few fighting arenas. There was also a bakery. Probably one of your favorite places to go when you actually had money.
    Of course, the only people out and about were all members of the guild. Loitering around the shops, cleaning and sharpening their weapons, or just leaning against walls looking menacing. Some were fighting. There was someone lying on the ground, and you weren't entirely sure if they were still alive.
    You figure you should probably head over to HQ to look at the list of job postings. Didn't exactly have much time (or money) to be hanging around town for the day.
        + [Head to the Guild Headquarters.]
        As you start walking in the direction of HQ, you feel something collide into you, hard, sending you spiralling backwards, your arms windmilling to try and regain your balance. But of course, you land on the cobbletstone ground with a thud, dust billowing up around you. How many more times was this going to happen to you today?
        "Oh, hey {protag}, didn't see you there!"
        You squint upwards, still on the ground, and see a giant hand reaching down to help you up.
        + + [Accept the offer.]
        You grab the hand, noticing just how massive it was compared to yours, and find yourself being roughly hauled back up onto your feet, almost losing your balance again in the process.
        -> char1Introduction
        + + [Get up on your own.]
        Knowing what this town was like, you weren't going to just accept help from anyone. You haul yourself back up to your feet.
        -> char1Introduction
        
        - (char1Introduction)
        The person you knocked you over was {char1}. He was this tall, super burly dude, who was a member of the guild just like you were. You'd worked with him a couple times before, so you were on good enough terms. At first glance, he definitely seemed pretty intimidating, but...
        "Sorry bout that!" he says, rubbing the back of his head with an apologetic grin on his face. " I'm in a bit of a rush right now!"
        "What's wrong?"
        "I can't find {char1bird} anywhere!"
            + ["...Who?"]
            You tilt your head, having to crank your head up to even looking him.
            "Uh... who?"
            "{char1bird}! Come on dude, don't tell me you forgot!"
            You really had forgotten.
                + + (remindMe) ["Remind me who that is again?"]
                "{char1bird}! My bird!"
                ~knowledge += bird
                Now that you think about it, {char1} did usually have a bird perched on his shoulder, a crow to be exact, that usually went everywhere with him. You never actually bothered to ask him its name you realize.
                "I can't believe you forgot about her!"
                "Ah sorry, guess I've been a little absentminded today," you say, giving him a sheepish grin.
                "Ah, no worries dude, I totally get it! Anyways, have you seen her anywhere?"
                    + + +  "Nope, sorry."
                    "Ah, no worries! Well I gotta keep looking! See you later!"
                    He runs off, occasionally cupping his hands together over his mouth and yelling out the name as he goes.
                    You shake your head and continue towards HQ.
                    -> headQuarters
                + + ["Oh, {char1bird}! Of course I remember!"]
                Worried by might offend him, you lie. "Oh yeah! {char1bird}! Course I remember," you say with a hearty laugh.
                {char1} grins down at you, "I thought so! Anyways, you seen her anywhere?"
                + + +  "Nope, sorry."
                    "Ah, no worries! Well I gotta keep looking! See you later!"
                    He runs off, occasionally cupping his hands together over his mouth and yelling out the name as he goes.
                    You shake your head and continue towards HQ.
                    -> headQuarters
            + ["Good luck with that man."]
            You clap him on the shoulder, well, actually it was his arm, his shoulder was too high up to reach but the intent was the same. "Good luck with that."
            You had other things to worry about at the moment.
            He smiles at you cheerfully, "Hey, thanks dude! Well I gotta keep looking! See you later!"
            He runs off, occasionally cupping his hands together over his mouth and yelling out the name as he goes.
            You shake your head and continue towards HQ.
            -> headQuarters
    
    = headQuarters
        You head inside the spacious office building. For as much money that the guild raked in, or at least you assumed, the interior of their headquarters certainly didn't reflect it. To be completely honest, the buldiding looked abandonded and completely trashed. You weren't entirely sure who managed any of the legislative stuff in the guild, it was all pretty secrative. You only really joined as a means for you to make money and find jobs easier. Well that, and, now that you'd joined it you couldn't exactly leave. They didn't treat desertion very lightly. 
        There are a few people inside, who all turn their heads in your direction when you enter. Not exactly welcoming either. You smile at them nervously as you pass. On the back wall, there are a couple boards set up, mostly used for job postings and also to list the current rankings.
        - (HQoptions)
        + [Check the current job listings.]
        You walk up to one of the boards set up with all of the current job listings. There's the usual: assasinations of high ranking officials in nearby towns, bounties out for escaped and on-the-run convicts, and even a couple up for monsters lurking in nearby forests terrorizing townsfolk. Unfortunately for you, a vast majority of these were definitely way too much for your skill set. You narrow down a couple that you might choose from- in other words, the ones you probably won't die try to do - all of which not really giving much reward money, but better than nothing.
        The first job listing in just a simple monster hunt. Theres a pack of beasts somewhere out in the woods that needs dealing with. Simple enough, and it doesn't look like anyone's taken this one yet. 
        The second one is a little bit trickier. This one involves hunting down a mercenary. It doesn't state what he did, just that there is a bounty out for his head. The reward money isn't all that much so you figure he probably isn't too big of a threat and you might be able to handle it. Plus the pay was slightly higher than the other one.
            + + [Take the first job. Go on a monster hunt.]
            -> jobOne
            + + [Take the second job. Hunt down that mercenary.]
            -> jobTwo
        + (Rankings) [Check the Assassin Rankings board.]
        {Rankings == 1:
        You weren't entirely sure why, or what the purpose was, but the guild had a ranking system set up for its members, and they usually had a board set up in HQ that display the up-to-date rankings of everyone. You assumed that the ranking was based on skill. That, or something like the amount of jobs they've completed or money they've brought in. To be honest you werent entirely sure, especially since you were consistently towards the bottom of the list anyways.
        You would think that assassins would have a reputation for being secrative and not wanting their identities to be known, but that certainly wasn't the case here. Everyone knew just about everybody. And the people at the top of the rankings definitely weren't shy about it being known either. People around here were definitely competitive about this sort of thing, and it wasn't uncommon for them to start targeting each other if they wanted to get up in the rankings. Not very subtle, but usually it didn't effect you so you didn't really care.
        - else:
        You walk over to the ranking board to see what its looking like today.
        -> CheckRankings
        }
        - - (CheckRankings)
            + + (YourRank) [Check where you're ranked.]
            {YourRank == 1: 
            You look at the list, starting at the top. You're eyes scan down the list for a while, looking for your name. Today it looks like you've been ranked at 839th place. Hey, that was up like, 5 more rankings than yesterday! But upon closer inspection you realize there are 30 less people on the list than there were before.
            At least there were still like 160 people ranked lower than you. Better than nothing.
            - else:
            {YourRank <= 3: Yup, you were still at rank 839.}
            {YourRank > 3 and YourRank <= 6: You're still ranked 839th.}
            {YourRank > 6 and YourRank <= 9: Not sure what you're expecting to be different here.}
            {YourRank == 10: 
                Woah, its a miracle! Somehow everyone else got taken out and you're ranked 10th now!
                ...
                Seriously though, it hasn't changed.
            }
            {YourRank > 10: Don't you have something better to do?}
            }
            -> CheckRankings
            + + (Char1Rank) [Check {char1}'s ranking.]
            {Char1Rank == 1: 
            You scan the board looking for {char1}'s name. To your suprise, he's actually ranked pretty high up, in the top 100's. He's ranked at 86th place. Impressive.
            You wonder why he even bothered working with you ever considering the difference between the two of you. And why he's actually pretty nice to you whenever you so happen to run into him. You also wonder how someone like him could even manage to get that high up in the first place. You figure its probably the muscles and leave it at that.
            - else:
            {char1} is still ranked pretty high up in the list, at rank 86. That fact still impresses you.
            }
            -> CheckRankings
            + + {checking_char2_ranking} [Check {char2}'s ranking.]
            -> CheckRankings
            + + [Go somewhere else.]
            -> HQoptions
        + [Head back out to town.]
        // add this in later
            -> END
    
    = jobOne
    The monster hunt request it is. It seemed like the easiest option, and you'd get enough reward money for it to at least pay the inkeeper back for a couple nights that you stayed there. As you start heading out to the edge of town you realize you never actually checked WHICH section of woods that the monsters were in. Well, you didn't really feel like walking all the way back so you take a guess.
        + [Head to the dark forest.]
            Monsters. Dark forest. They'd have to be there right? Granted it probably was the most dangerous place outside of town to go, but it was also probably the most likely place for those monsters to be hiding. You start heading in the direction of the dark forest.
            You arrive fairly quickly. As the name implies, it was certainly dark, even in daylight. The trees overhead were so thick they blocked out nearly all light. You could hear the faint howling and snarling of beasts deep into the woods. All around the floor, you could see tracks of various different creatures that must roam the area. You must have guessed correctly. Time to start hunting for those monsters.
                + + [Move in the direction of the howling.]
                You start heading in the direction of the howling, climbing over the thick bundle of roots and foliadge along the forest floor. As you do so, your foot gets caught on a root and you end up tumbling forwards onto the ground. All the sounds of the forest come to a halt. That doesnt seem good.
                -> wolfEncounter
                + + [Follow the tracks on the forest floor.]
                You start following the tracks on the forest floor, pealing back foliadge to make sure you stay on the right trail. The forest floor was thick with roots and fallen branches. It really was a matter of time before you-
                Your foot gets caught on an upraised root,and you tumble forwards onto the ground. All of the sounds of teh forest come to an immediate silence. That doesnt seem good.
                -> wolfEncounter
        + [Head to the lake forest.]
            You know there's a lakeside forest not all too far from here. There were quite a few hiding spots near the water where monsters would often stay. This seemes like the most likely place for them to be, so you head in the direction of the lake. 
            When you arrive, you look out onto the glittering surface of the water as it reflects off the morning sun. It was awfully peaceful here, it almost felt like you wouldn't find anything montrous here at all. But of course, you decide to look around anyways.
                + + [Continue.]
                    You look around the surrounding woods my the lakeside. For a long while, you're worried that you might have guessed incorrectly, that is, until you come across the remains of what appears to be some sort of camp. Theres a scattered pile of burnt wood, surrounded by what appers to be tattered tents and supplies. And also blood smeared all over the ground. You pick around in the wreckage and even find a mangaled human foot. A shudder runs down your spine. The monsters must be here.
                    + + + [Wait at the camp.]
                    You decide to wait at the camp. You'd rather let the monsters come to you than you to them. Surely they'd come back eventually if they'd been here before.
                    You wait and wait, but nothing shows. For a moment, you think that this might not have been the work of monsters after all. You get up, ready to search somehwere else.
                    -> job1Failure
                    + + + [Search nearby.]
                    You look nearby, hoping to find more evidence of where the monsters might have gone. Eventually, you come across the entrance of a cave tucked into the side of a hill. There are piles of bones scattered around the entrance. This must be where they are.
                         + + + + [Search inside.]
                         You creep inside of the cave, hoping to find the monsters still inside. Your footsteps are near silet.
                         Until you hear a harsh snap. You freeze in place and look down. You see a small white bone shattered underneath your foot.
                         Further into the cave, you hear the sound of claws scraping against stone and the sound of low gutteral growling.
                         -> monsterEncounter
                         + + + + [Lure them out.]
                         Rather than risk going inside of the cave, you instead choose to try and lure the monsters out. Crouching down in the nearby brush, you reach down to grap a handful of pebbles and hurl them towards the entrance of the cave.
                         Almost imediately you hear the sound of claws scraping against stone and low gutteral growling as the monsters are roused from within the cave.
                         -> monsterEncounter
                    ~knowledge += monsterLocation
            -> job1Failure
        + [Head to the swamp forest.]
        The swamp? Maybe, might as well check. At least it sounds at least a bit more welcoming than the dark forest. You start heading in the direction of the swamp.
        You know you made it there when you take a step and your foor sinks into the ground, and you can feel hordes or bugs starting to hone in on your location, crawling all over your arms. You swat them away, barely a moment to rest before more start to swarm you. You have half the mind to just go back, but you were already here, so might as well keep checking.
        You look around for a while, not really finding anything other than bugs and mud and half-dead trees. With a sigh, you decide to head back.
        But when you start to take a step, you realize your foot is stuck. You pull and yank on your leg, but you're stuck in the mud, the bugs still nearly eating you alive. Thats a problem.
            + + [Try to pull up on the nearest branch.]
            You stretch your arm out, trying to latch onto a tree branch hanging nearby. When you finally get a hold up it, you give it a swift tug.
            And the branch snaps in two. Well then.
                    - - - (stuck)
                    + + + [Try to get out.]
                    {stuck < 5: 
                    You twist and turn trying to get your leg unstuck, water sloshing all around you, but it doesnt budge.
                    - else:
                        This really isn't going to work.
                    }
                    -> stuck
                    + + + [Yell for help.]
                    -> Yell1
            + + (Yell1) [Yell for help.]
            With not much of an option, you start to yell for help. There probably wasn't anyone nearby, but what other choice did you have? 
            You yell and yell and yell, but no one comes. Its just you and the bugs.
            + + + [Continue]
            -> job1Failure
    
    - (wolfEncounter)
    But then, just a few feet from you, that snarling sound that you were following starts up again. You look up, slowly, and find yourself face to face with the fangs of a creature, its maw dripping with saliva as it growls at you, its breath stinging your face... wait, this isn't even the monster you were searching for. It was just a regular wolf. Big, with matted fur and razor sharp fangs, but still just a wolf.
                But it wasn't alone. There was a whole group of them, looking equally as vicious standing right behind it.
                    + [Reach for your weapon.]
                        You slowly reach behind your back, and grasp at air. Your eyes widden. When had you lost your dagger? Your mind scrambles, thinking back at everything that had happened today. Was it when {char1} knocked you over? Had you been stupid enough to leave it at the inn?
                        ~knowledge += lostWeapon
                        Well, looks like you have no other choice.
                            + + [Start running.]
                            -> Run1
                    + (Run1) [Start running.]
                        You laugh nervously. "Ha ha, good doggy?"
                        The wolf lunges at you and you barely dodge backwards fast enough to avoid it biting your head off, its jaws luckily snapping close on nothing but air. 
                        You scramble to your feet without a moments hesitation and start running back the way you came. You hear the wolves hot on your trail, snapping and growling at you, their claws pounding against the forest floor.
                        With your lungs burning, you reach the edge of the trees and make it out of the forest. You look back to see the wolves all slide to a stop, not daring to exit the forest. They prowl the treeline for a moment before slinking back into the shadows.
                        You let out a breath, feeling relieved.
                        + + [Continue]
                        -> job1Failure
    - (monsterEncounter)
    Within moments, the sound of those claws against the stone quickens, as you realize the monsters have already started running towards you. You're about to take a step back before you see the heads of those creatures emerge from the shadows. These were definitely the right ones.
    They spot you within moments, their glowing red eyes turning over to you, sending a chill down your spine. This job certainly sounded easy in theory, but you were starting to have doubts.
        + [Reach for your weapon.]
            You slowly reach behind your back, and grasp at air. Your eyes widden. When had you lost your dagger? Your mind scrambles, thinking back at everything that had happened today. Was it when {char1} knocked you over? Had you been stupid enough to leave it at the inn?
            ~knowledge += lostWeapon
            Well, looks like you have no other choice.
                + + [Start running.]
                    -> Run2
        + (Run2) [Start running.]
        You really couldn't fight them after all.
        You turn around and start running, practically tripping over yourself. 
        The speed of those monsters steadlily increases behind you, they wer nearly at your heels, snapping and clawing at you as you ran.
        You weren't going to make it. They were much too fast.
            + + [Continue.]
            ~failed_loops += 1
            ~knowledge += job1Failed 
            ~previous_death = "monsters"
                Within seconds, you feel a monster pounce of you, its claws tearing into your back. You let out a scream of pain, only to be met with the sound of the creatures howling in delight.
                The strength fades from your body quickly, as the monsters begin to feast.
                Your vision fades to black.
                + + [Wake up.]
                    -> wakeUp
    
    - (job1Failure)
    ~failed_loops += 1
    ~previous_death = "assassin"
    ~knowledge += job1Failed
    That is, until you feel a sharp pain in your chest.
    "Wha-"
    You look down to see a sword piercing through your chest, covered in blood.
    You reach up, your hands shaking as the corners of your vision starts to fade.
    And then everything turns black.
    + [Wake up.]
        -> wakeUp
    
    
    = jobTwo
    You decide to go with the second option. It doesn't give all too much information, but it does give you enough where you could probably track down this mercenary no problem. You head out of town, following the road to the next town over where it says that he was last spotted. 
    Not too strangely, this town wasn't all too different from the one that the guild was located in, mainly in that it was filled with similarly suspicious types. However, in this case it wasn't only crimminals and other unerworld sorts of folk around here, but there were also just regular citizens about too.
    Not making yourself too obvious, you walk through the town for a while, seeing if theres anyone who might fit the description of the man you were looking for. This did mean you got to see a fair bit of the town. What you did see wasn't all that great. In the darkest corners of town, you saw a few instances of townfolk getting haggled for cash or even robbed. Quite a few black market deals as well. Just like home, you thought bitterly. Though at least here people didn't go around blatantly fighting eachother out in the open, for better or worse.
        + [Continue]
            After a while of searching, the sun now setting, you find a man wearing a heavy cloak. Not all too much more suspicious than the other types of people around, but he fit the description well enough. You figure it was worth a shot. 
            You follow him around for a while, careful to not make yourself seen on the chance that he looked back and saw you tailing him. Eventually, he enters a tavern. Just as you're about to follow him inside you hear a scream coming from behind you. That scream sounded young. You stop in your tracks. If you let the man go, you might have trouble finding him again. But...
                + + [Help the children in trouble.]
                    You sigh. Against your better judgement you turn around, and sneak into the alley behind you. Guess you probably weren't getting paid today.
                    When you peak around the corner of the building, in the shadows you see is two young children cornered by a man holding a knife. One of the children stands in front of the other, who is clutching desperately onto a basket. 
                    You couldn't just leave this be.
                        + + + [Reach for a weapon.]
                        ~knowledge += lostWeapon
                        You reach behind your back to pull out your dagger, only to grasp at thin air. Oh. You didn't even have a weapon with you. Where had you lost it? Was it when {char1} bumped into you earlier? Or had you really been stupid enough to leave the inn without making sure you had it? Well, you suppose you'll have to risk going in without a weapon.
                                + + + + [Use your fists.]
                                    -> Fists1
                        + + + (Fists1) [Go in with your bare-handed.]
                        Quietly, you sneak up behind the man, whose back is turned to you, and before he has time to realize you're there, you grab the arm holding the knife and slam it into the wall next to you. The knife clatters to the ground, and as he starts to turn around to face you, you take an elbow and slam it into his face. He drops to the floor like a sack of brinks. Wiping your hands together, you put your hands on your hips, rather proud of yourself, and turn towards the two children.
                        "You two all right?"
                        All they do is look at you, well, more like behind you, a growing fear creeping up on their faces.
                        -> job2Failure
                + + [Keep following the man.]
                    Though part of you regrets it, you couldn't risk losing the money for this job. You follow the man inside. 
                    The tavern was certainly busy, with all sorts of people milling about.
                    You watch the man move to the back of the room, finding a seat. He appeared to be sitting alone. At least for now. There were a lot of people around, but because of that, no one would notice you. And no one would notice what happened in the back of the room.
                    You move through the crowd, finding a table not to far from him. You could deal with this now, or you could wait till he leaves. He doesnt appear to have noticed you yet. 
                        + + + [Reach for a weapon.]
                        ~knowledge += lostWeapon
                        You reach behind your back to pull out your dagger, only to grasp at thin air. Oh. You didn't even have a weapon with you. Where had you lost it? Was it when {char1} bumped into you earlier? Or had you really been stupid enough to leave the inn without making sure you had it? Well this complicates things. You suppose you really will have to wait for him to leave, hopefully alone, and deal with him then.
                                + + + + [Wait for him to leave.]
                                -> Wait1
                        + + + (Wait1) [Wait for him to leave.]
                        You sit at your table making sure to keep an eye on the man not to far away. You realize ikt would definitely look a lot less supicious if your ordered something to drink but, thinking back on the reason you didn't have any money in the first place, you shrink back in your chair.
                        After a while, somone else comes and sits at the table accross from the man. The two have a short conversation, exchange something, and then the leave, the man once again sitting alone at the table. He slips something in his pocket before getting up to leave as well. Now you really didn't care what that whole conversation was about, it wasn't exactly in your job description, but you were just glad he seemed to be leaving by himself.
                        You follow quietly after him. Back outside you watch him slip into an alleyway. What a shocker.
                        Just as you are about to follow after him, you feel something cool get press against your throat.
                            + + + + [Continue]
                            Ah, a knife, wonderful. 
                            "Alright, what's all this about again?"
                            You feel the knife press closer against your throat. You squirm a bit. You really wish you had a weapon on you right about now. 
                            A gravely voice growls into your ear, "Don't get cocky."
                            You laugh nervously, "Ha ha, of course not."
                            "Why the hell are you following me?"
                            You thought you'd been sneaky enough, but apparently not. {headQuarters.YourRank: Some ranked 839 assassin you were, you laugh quietly to yourself.}
                            "Thought it'd be fun, really."
                            You feel a sting on your neck, and something warm slide down your neck.
                            "Answer the question, or I'll kill you right here. No playing around."
                            Were you really going to die here?
                                + + + + + [Fight back.]
                                In a last ditch effort, you step down hard on the inside of his foot. He staggers and grunts in pain, just enough for you to move your arms between the knife and your neck. You feel another sharp sting as he slices along your arm. Better than the alternative. 
                                You turn around to face him, but he'd already started backing away from you.
                                You laugh tauntingly. Were you really that fearsome?
                                That was, until you notice him looking at something behind you. He almost looked afraid even/
                                -> job2Failure
                                + + + + + [Make something up.]
                                ~failed_loops += 1
                                ~previous_death = "mercenary"
                                ~knowledge += job2Failed
                                "Ah ha, well to be honest..."
                                You trail off, what were you going to say to convince him.
                                "I just uh... thought you were cute?"
                                Nicely going.
                                He aparently didn't find that all too funny, as he drags the knife accross your throat without hesitation.
                                You fall forwards, clutching at your neck as the life spills out of you.
                                Its no long before your vision fades to black.
                                    + + + + + + [Wake up.]
                                    -> wakeUp
                                    
            - (job2Failure)
            ~failed_loops += 1
            ~previous_death = "assassin"
            ~knowledge += job2Failed
            Before you have a chance to react, you feel an agonizingly sharp pain stab through your chest.
            "Wha-"
            You hear the sound of something dripping down on the cobblestones in front of you.
            You look down, your vision already starting to fade, only to see a blade protruding outwards from your chest, covered in blood. 
            You watch as the blade slowly slides backwards. You try to turn your head to see the perpetrator, but your vision fades to black.
                + [Wake up.]
                -> wakeUp
    
    = tavern
    -> END
    
    =searchForBird
    -> END

-> END
