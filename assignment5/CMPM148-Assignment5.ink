// CMPM 148 - Assignment 5: Time Loop Game


// CHARACTER NAMES (listed as variables so they can be easily changed)
VAR protag = "Kiran"
VAR protagNickname = "Kir"
VAR char1 = "Rivin"
VAR char1bird = "Crowly"
VAR char2 = "Aeula"

// VARIABLES
// variables which persist across loops
LIST knowledge = timeLoop, bird, lostWeapon, monsterLocation, job1Failed, job1Success, job1Assassin, job2Failed, job2Success, job2Assassin, assassinAppearance
VAR killed_by_assassin = 0
VAR checking_char2_ranking = false
// variables used per each loop that reset
VAR actions_this_loop = 0
VAR has_weapon = false
VAR face_cut = false
VAR previous_death = "default"


// STORY CONTENT
~knowledge = ()
-> Begining

=== Begining ===
-> wakeUp

= wakeUp
// reset variables
~actions_this_loop = 0
~has_weapon = false
~face_cut = false
// begining of time loop
When you awaken, still bleary eyed, you are met with the sight of the half-rotted wooden ceiling of the inn that you'd spent the night in, sunlight staring to stream in from the window. {wakeUp == 3: Okay, all of this was starting to get a bit repetitive. Even now, you could still feel those faint traces of pain in your body from that part of your dream before you woke up.<br><br>No, this couldn't have been a dream. A dream inside a dream? Were you still dreaming now? There's no way it was possible.}{wakeUp <= 2: You sit up in the creaking bed, your head still{wakeUp == 1: pounding from the night before. Yeah, you might have went just a bit overboard. You don't really remember anything that happened last night other than the fact that you definitely spent all of the money you had gotten from that last job you did. Already. And probably then some. |{wakeUp==2: - wait. <br><br> Actually, your head didn't really hurt all that bad. Which was suprising considering the night before. But, even though your head wasn't hurting,{previous_death == "assassin": you could still feel this intense stabbing pain in your chest.}{previous_death == "monsters": you could still feel this intense stinging pain lacing all throughout your back.}{previous_death == "mercenary": you could still feel just the slightest twinge of pain arching across your neck.} But, why was that? You think back to the last thing you remember. Although a bit foggy, you could still remember pieces of that dream you had. Hadn't you... died at the end of that dream, just before you woke up? You can just barely remember it. Sure, it had felt pretty damn realistic, but why were you still feeling that pain now? Strange.}}}
You try to rub the sleep out of your eyes and roll out of bed with a groan{wakeUp > 1:, your body still aching all over}. {wakeUp == 1: You stand up for a moment, waiting for the pain in your head to subside. You stand there, just staring at the wall, swaying slightly, eyes half closed with a blank expression on your face. When you think you've mustered enough strength, you take a step. But you're immediately met with the hard wooden floor as your legs give out from under you.<br><br>"Well shit," you mutter under your breath, the sound muffled by your face pressed against the floor.|{wakeUp == 2: Really, why didn't your head hurt but everywhere else did? What did you do last night? You think about that dream again. It really was so strange. You shake off the memory and decide to go downstairs and head out for the day. You needed to try and get more money after you blew it all off yesterday.}}
    + {wakeUp == 1} [Come on, get up.]
    -> introMonolouge
    + {wakeUp > 1} [Head out for the day.]
    -> HeadOut
    - (introMonolouge)
    With a bit of a struggle, you use all of the strength in your arms to get yourself back up on two feet. Your head is still spinning but you manage to stand upright this time. 
    You laugh quietly to yourself, but wince at the sharp pain in your head. Some assassin you were.
    Yup, believe it or not, you were actually an assassin working at the local Assassin's Guild in this town. Actually, the entire town WAS the whole guild more or less. You can't imagine there were actually any sane people that lived here given the types of people that roamed these streets. It was called an Assassin's Guild, but, really, it consisted of just about anyone and everyone who made a living by killing, human or otherwise: bounty hunters, executioners, hit-men, you name it.
    Anyways, you'd love to just lie back down and go to sleep, but you figure you ought to get out and find a new job. You needed the money, that was for sure, especially since this was probably the fourth time you crashed at this inn without having the money to pay for it. The innkeeper was nice enough to only threaten to kill you every time you left without paying, but your tab was steadily growing. If it happened again, those threats would probably stop being threats. You figured now was about time you actually paid them back.
        + + (HeadOut) [Start heading out.]
        As you head down the stairs{wakeUp == 1:, still feeling a bit groggy,} to the first floor, you hear someone yell out your name.
        "{protag}!"
        {wakeUp == 1: 
        You freeze in place, and reach up to press on your ears, the loud yelling making your head pound even more than it already was. "Wh-what?"
        Suddenly, you see a flash of light, and your eyes widden as a sharp object flies right past your face, embedding itself into the wall right next to you. You slowly turn your head to see a knife, its handle still quivering, lodged into the wall right next to your head.
        You stumble backwards in shock, falling back onto the ground. You reach up to feel your face to find a shallow cut running along your cheek. When you remove your hand, you find your fingers covered in a thin layer of blood.
        You turn your head swiftly over to the front desk, enraged, "Hey! What the hell!"
        The innkeeper stands behind their desk, hand still extended, pointing an accusatory finger at you. They glare in your direction. "If you're gunna keep staying here, you better pay! This place isn't free you know!"
        "Yeah, yeah, I know jeez!" you shout back, wiping the blood off of your face with the back a sleeve. You were certainly more awake now.
        "Next time I wont miss!"
        Standing back up and brushing yourself off, you reply under your breath, "Well then I couldn't exactly pay you back then could I?"
        They just glare at you, their eyes following you as you walk out the front door back into the town.
        ~face_cut = true
            + + + [Head out to the center of town.]
            -> townCenter
        - else:
        {wakeUp == 2:
        This felt... really familiar.
            + + + [Take a step back.]
            ~face_cut = false
            Instinctually, you take a small step backwards, just in time to see a knife bury itself into the wall where you had been standing. Didn't something like this happen in your dream? There's no way that was just a coincidence, right?
            The innkeeper scoffs from behind the counter. "Lucky dodge," they mutter under their breath.
            You look over to see them pointing an accusatory finger at you yelling, "If you're gunna keep staying here, you better pay! This place isn't free you know!"
            You're too stunned to respond. Hadn't this exact echange happened in that dream? Maybe you were just psychic? No, no, it had to just be a coinsidence.
            You keep walking towards the front door, lost in your thoughts for a bit.
            You barely register them saying "Next time I won't miss!" before you push open the door to the outside.
                + + + + [Head out to the center of town.]
                -> townCenter
            + + + [Keep walking.]
            ~face_cut = true
            You must be crazy, theres no way THAT was going to happen. It was just a dream after all. You shrug to yourself and continue walking as usual.
            That is, until you see a flash of light and feel something sharp slash right along your cheek. There's no way.
            You slowly turn your head to the side to see a knife embedded into the wall, its hilt still quivering from the impact. You reach up to your face and, sure enough, find it bleeding.
            Okay, even if this exact thing happened in your dream, surely it was just a conisidence. You're sure the innkeeper is probably pissed at you for taking so long to pay them back, you must have just subconciously figured that they would react like this.
            The innkeeper stands behind their desk, hand still extended, pointing an accusatory finger at you. They glare in your direction. "If you're gunna keep staying here, you better pay! This place isn't free you know!"
            You laugh nervously, your hand still covering the wound on your face, and reply a bit absentmindedly, "Yeah, yeah alright I'll deal with it." They raise an eyebrow at you, still wearing an angry glare on their face.
            You keep walking towards the front door, lost in your thoughts for a bit.
            You barely register them saying "Next time I won't miss!" before you push open the door to the outside.
                + + + + [Head out to the center of town.]
                -> townCenter
        }
        {wakeUp > 2:
        -> townCenter
        }
        }
        
    = townCenter
    You find yourself standing out in the center of town. You stretch out your limbs, still a bit stiff from sleeping on that rock hard bed. Looking around you see its as busy as usual, even this early in the morning. 
    {wakeUp == 1:
    There are several different shops lined up around the square, most of which were either selling weapons, armor, poisons, and a variety of other different tools of destruction. Of the surrounding buildings, they mostly consisted of taverns and gambling dens, a few blacksmiths, and even a few fighting arenas. There was also a bakery. Probably one of your favorite places to go when you actually had money.
    Of course, the only people out and about were all members of the guild. Loitering around the shops, cleaning and sharpening their weapons, or just leaning against walls looking menacing. Some were fighting. There was someone lying on the ground, and you weren't entirely sure if they were still alive.
    You figure you should probably head over to HQ to look at the list of job postings. Didn't exactly have much time - or money for that matter - to be hanging around town for the day.
    - else:
    {wakeUp == 2:
    You try to shake off that encounter with the innkeeper this morning, and that strange pain you'd woken up with. Regardless of what happened in that dream - you shudder when you think about how real it had felt when {previous_death == "assassin": that sword had pierced you through the heart}{previous_death == "monsters": those monsters had sliced open your back}{previous_death == "mercenary": that mercenary had slit open your throat} - you still had to try and make some money today right? You weren't going to be able to last very long without any spending money that was for sure.
        + [Wait for a moment...]
        Its still just a hunch but, before you start heading over to HQ, you stand your ground, waiting for just a moment. Sure enough, you watch as {char1} barrels past you, right where you would have walked. He's still calling out for {char1bird}{knowledge ? bird:, his bird|, though you still aren't sure who that is to be completely honest}. 
        The innkeeper and now {char1}. Both things that happened in your dream. 
        {knowledge ? lostWeapon: 
        Wait, now that you think about it, you didn't have you're dagger with you either in that dream. Just to be sure, you reach behind you back to feel for it and... nothing. It wasn't on you. Were you really going to go on a job without your weapon on you? Sure it was just a dream, you think, but you remember what happened to you when you went out without it.
            + + {not has_weapon} [Go back to the inn to check for your dagger.]
            You rush back into the inn, the innkeeper yelling something at you as you pass them, and run up the stairs back to your room. Breathing heavily, you begin to search frantically around the room and, sure enough, you find it laying on the ground underneath the bed. You grab in and tuck it into its sheath at your waist, letting out a sigh of releif. Back where its suppose to be. Wow, you really WERE stupid enough to leave it at the inn.
            Anyways, with your weapon now in hand, you head back off to HQ to find a job to do. Preferably one that wouldn't end the same way as that super weirdly realistic dream.
            ~has_weapon = true
            -> headQuarters
        }
            + + [Head to the Guild Headquarters.]
            {knowledge ? lostWeapon: Nah, you didn't need it. It was just some dumb dream anyways. And even if it weren't, which you highly doubted, there's no way you would die doing some easy job, would you?}
            -> headQuarters
    }
    }
        + [Head to the Guild Headquarters.]
        As you start walking in the direction of HQ, you feel something collide into you, hard, sending you spiralling backwards, your arms windmilling to try and regain your balance. But of course, you land on the cobbletstone ground with a thud, dust billowing up around you.
        {wakeUp == 1: How many more times was this going to happen to you today?}
        "Oh, hey {protag}, didn't see you there!"
        You squint upwards, still on the ground, and see a giant hand reaching down to help you up.
        {wakeUp  == 2: It was {char1}. You just knew it was. Just like in that dream. Oh this was so not a good sign given how that dream ended.}
        + + (AcceptOffer)[Accept the offer.]
        {wakeUp == 1:You grab the hand, noticing just how massive it was compared to yours, and find yourself being roughly hauled back up onto your feet, almost losing your balance again in the process.}{wakeUp == 2 and AcceptOffer > 1: You let {char1} pull you to your feet once more, this time landing on your feet more steadily. | {wakeUp == 2 and AcceptOffer == 1: This time, you let {char1} help you up, after all he was certainly nicer than most other people around here. ou grab the hand, noticing just how massive it was compared to yours, and find yourself being roughly hauled back up onto your feet, almost losing your balance in the process.}}
        -> char1Introduction
        + + (RefuseOffer)[Get up on your own.]
        {wakeUp == 1: Knowing what this town was like, you weren't going to just accept help from anyone. You haul yourself back up to your feet.}{wakeUp == 2 and RefuseOffer > 1: Look, {char1} may be nice enough, but you still didn't entirely trust him. Besides, you'd rather just get up on your own, you didn't need any help. You haul yourself back up on your feet.|{wakeUp == 2 and RefuseOffer == 1: You remember how he hauled you back up in your dream. He wasn't exactly the most gentle person, wether he intended it or not. Even if it was just a dream, you'd rather just get up on your own. You haul yourself back up on your feet, brushing yourself off.}}
        -> char1Introduction
        
        - (char1Introduction)
        {wakeUp == 1: The person you knocked you over was {char1}. He was this tall, super burly dude, who was a member of the guild just like you were. You'd worked with him a couple times before, so you were on good enough terms. At first glance, he definitely seemed pretty intimidating, but...}
        "Sorry bout that!" he says, rubbing the back of his head with an apologetic grin on his face. " I'm in a bit of a rush right now!{face_cut: Oh wait, what happened to your face? Are you okay??}"
        {wakeUp == 1: 
        You think back on this morning and that lovely exchange you had with the innkeeper. "Ah don't worry about it. What's up with you though?"
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
            - else:
            {wakeUp == 2: 
            This really was all too familiar. You sigh. 
            "{face_cut: I'm fine, dont worry about me.}Let me guess, you're looking for {char1bird}?"
            "Oh yeah I am! How did you know that?"
            This was SO weird. You really were starting to doubt that was a dream. A prophetic vision perhaps? A warning not to get yourself killed going out on a job today?
            You laugh nervously, {knowledge ? bird: "Well she's usually with you, isn't she? I didn't see her so I just guessed." | "Oh, just a lucky guess I suppose."}
            He beams at you, "{knowledge ? bird: Woah, you actually noticed she was gone?|That's awesome dude!} Anyways have you seen her anywhere?"
            You shake your head slowly.
            "Ah well, that's okay. Well I gotta go, see you later!"
            He scampers off, calling out {char1bird}'s name as he goes.
            What was going on? That thing with the inkeeper and now {char1}?
            {knowledge ? lostWeapon: 
            Wait, now that you think about it, you didn't have you're dagger with you either in that dream. Just to be sure, you reach behind you back to feel for it and... nothing. It wasn't on you. You look on the ground where {char1} kocked you over and don't see it either.
            Were you really going to go on a job without your weapon on you? Sure it was just a dream, you think, but you remember what happened to you when you went out without it.
            + + {not has_weapon} [Go back to the inn to check for your dagger.]
            You rush back into the inn, the innkeeper yelling something at you as you pass them, and run up the stairs back to your room. Breathing heavily, you begin to search frantically around the room and, sure enough, you find it laying on the ground underneath the bed. You grab in and tuck it into its sheath at your waist, letting out a sigh of releif. Back where its suppose to be. Wow, you really WERE stupid enough to leave it at the inn.
            Anyways, with your weapon now in hand, you head back off to HQ to find a job to do. Preferably one that wouldn't end the same way as that super weirdly realistic dream.
            ~has_weapon = true
            -> headQuarters
            }
            + + [Head to the Guild Headquarters.]
            {knowledge ? lostWeapon: Nah, you didn't need it. It was just some dumb dream anyways. And even if it weren't, which you highly doubted, there's no way you would die doing some easy job, would you?}
            -> headQuarters
            }
            }
    
    = headQuarters
        You head inside the spacious office building. {wakeUp == 1: For as much money that the guild raked in, or at least you assumed, the interior of their headquarters certainly didn't reflect it. To be completely honest, the buldiding looked abandonded and completely trashed. You weren't entirely sure who managed any of the legislative stuff in the guild, it was all pretty secrative. You only really joined as a means for you to make money and find jobs easier. Well that, and, now that you'd joined it you couldn't exactly leave. They didn't treat desertion very lightly.}
        There are a few people inside, who all turn their heads in your direction when you enter. Not exactly welcoming either. {wakeUp <= 3: You smile at them nervously as you pass. {wakeUp == 3: You're really starting to get tired of the fake humility though.} | {wakeUp <= 5: You've stopped bothering to aknowledge them anymore. Whatever, let them have their way, you're too tired to deal with it anymore. | You stare back at a few of them, glaring. They really were annoying.}} On the back wall, there are a couple boards set up, used for job postings and also to list the current rankings.
        - (HQoptions)
        + [Check the current job listings.]
        You walk up to one of the boards set up with all of the current job listings. There's the usual: assasinations of high ranking officials in nearby towns, bounties out for escaped and on-the-run convicts, and even a couple up for monsters lurking in nearby forests terrorizing townsfolk. {wakeUp == 1: 
        Unfortunately for you, a vast majority of these were definitely way too much for your skill set. You narrow down a couple that you might choose from- in other words, the ones you probably won't die try to do - all of which not really giving much reward money, but better than nothing.
        The first job listing in just a simple monster hunt. Theres a pack of beasts somewhere out in the woods that needs dealing with. Simple enough, and it doesn't look like anyone's taken this one yet. 
        The second one is a little bit trickier. This one involves hunting down a mercenary. It doesn't state what he did, just that there is a bounty out for his head. The reward money isn't all that much so you figure he probably isn't too big of a threat and you might be able to handle it. Plus the pay was slightly higher than the other one.
        - else:
        {wakeUp == 2:
        As you scan through the different jobs, trying to pick out ones that you might do, you realize that they are all the same as the ones from you dream. You close your eyes, breathing out. This definitely wasn't just coincidence anymore.
        And once again, the only options that seemed reasonable were the monster hunt - the same type of monster from that dream of course - and the bounty out on that mercenary - again, with the same description from the dream. Maybe you ought to stop referring to it as a dream. A vision more like it.
         {jobOne == 1: You shudder thinking back to that monster hunt job from that vision. {previous_death == "monsters": The way that those monsters tore right through you with ease. More nauseatingly, you think to how they probably ate your corpse afterwards, or tried to, and shudder at the thought. Yeah, no thank you.}{previous_death == "assassin": You can barely remember it, but you'd been stabbed, right through the chest, from behind. Who was that anyways? That was so random. Was it some kind of vision metaphor? Like it was telling you how dumb you were for not checking the location of the monster first?} Maybe that vision was a sign to take the other job, you'll probably have more luck with it anyways. {has_weapon: Although, now you did actually have your dagger this time. That might make the whole situation a bit easier to deal with.}}
         {jobTwo == 1: Thinking back on that vision, you remember how poorly the whole situation with the second job had went. {previous_death == "mercenary": You couldn't even handle the mercenary in that vision. Though to be fair, maybe you'd just said the wrong thing. You think back to what you'd said and grimace. That WAS pretty stupid.}{previous_death == "assassin" and HelpChildren: You'd risked helping out those kids. And though you had, you ended up getting stabbed in the back anyways! Which was really weird? Who even was that? Maybe it was some type of weird vision metaphor. Like trying to save people was some waste of time. But that seemed pretty messed up.}{previous_death == "assassin" and not HelpChildren: You'd managed to overpower that mercenary, even without a weapon, but were still stabbed in the back! Maybe it was whoever that man had talked to in that tavern, though something about his expression made it seem like he didn't recognize the person.}{has_weapon: Although, now you did have your dagger with you, which might solve some of your problems.}}
        }
        }
            + + [Take the first job. Go on a monster hunt.]
            {wakeUp == 1: -> jobOne}
            {wakeUp == 2 and jobOne == 1: 
            You know what, you wanted to try this job again. With the warning from that vision, you were sure to not mess it up again. {has_weapon: Especially with your weapon now in your possession. Those monsters{previous_death == "assassin":, or whoever that guy who stabbed you was,} wouldn't be much of an issue.}
            {not (knowledge ? monsterLocation): 
            ~knowledge += monsterLocation
            Oh, and you ought to check where the monsters actually where this time. There was no way you were going to go to the wrong place again and get stabbed in the chest by that weirdo again. You look a bit more carefully at the job request this time and see that the monsters are located at the lakeside forest. Whoops. 
            }
            Now, you could always reconsider. The vision did warn you about this job in particular. It would probably be safer to choose the other option.
                + + + [Go for it.]
                -> jobOne
                + + + [Actually, lets try the other job.]
                -> jobTwo
            - else:
            -> jobOne
            }
            + + [Take the second job. Hunt down that mercenary.]
            {wakeUp == 1: -> jobTwo}
            {wakeUp == 2: 
            Actually, you did want to try this job again. With the warbing from that vision, you were sure to not mess it up again. {has_weapon: Especially with your weapon now in your possession. That mercenary{previous_death == "assassin":, or whoever that guy who stabbed you was,} wouldn't be much of an issue.}{not HelpChildren: Besides, now you knew that the mercenary had actually known you were there the whole time. You could be much sneakier now. And besides that, knowing that the mercenary had been in that tavern to meet up with someone might mean you'd have time to help out those kids first.}{HelpChildren: Maybe it wasn't worth risking it to help those kids like you'd thought. But hey, now you knew someone had been sneaking up behind you that time, they wouldn't get the drop on you again.}
            Now, you could always reconsider. The vision did warn you about this job in particular. It would probably be safer to choose the other option.
                + + + [Go for it.]
                -> jobTwo
                + + + [Actually, lets try the other job.]
                -> jobOne
            - else:
            -> jobTwo
            }
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
            You look at the list, starting at the top. You're eyes scan down the list for a while, looking for your name. Today it looks like you've been ranked at 839th place. Hey, that was up like, 5 more rankings than yesterday! But upon closer inspection you realize there are 30 less people on the list than there were before. Tough competition, you think.
            At least there were still like 150 people ranked lower than you. Better than nothing you suppose.
            - else:
            {YourRank <= 3: Yup, you were still at rank 839.}
            {YourRank > 3: You're still ranked 839th. You shouldn't be suprised.}
            {YourRank > 10: You're still ranked 839th. Really, it hasn't changed.}
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
    
    
    = DarkForestInterrupt
    Wait, why were you going here? You knew that the monsters wouldn't be here. {DarkForest >= 1: Besides, the last time you came here, you ended up getting stabbed in the back by that mysterious figure.}
                + + [Keep going anyways.]
                Sure. Go for it.
                -> theDarkForest
                + + [Go to the correct location.]
                You instead decide to go to where you know the monsters actually are, rather than wasting your time here{theDarkForest > 1: again}.
                -> LakeForest
                
    = SwampForestInterrupt
    Wait, why were you going here? You knew that the monsters wouldn't be here. {theSwampForest == 1: Besides, the last time you came here, you ended up getting stabbed in the back by that mysterious figure... after getting stuck in the mud.}
                + + [Keep going anyways.]
                Sure, why not. Have fun warndering around.
                -> theSwampForest
                + + [Go to the correct location.]
                You instead decide to go to where you know the monsters actually are, rather than wasting your time here{theSwampForest >= 1: again with the bugs}.
                -> LakeForest
    
    = jobOne
    The monster hunt request it is. It seemed like the easiest option, and you'd get enough reward money for it to at least pay the inkeeper back for a couple nights that you stayed there. {not (knowledge ? monsterLocation): As you start heading out to the edge of town you realize you never actually checked WHICH section of woods that the monsters were in. Well, you didn't really feel like walking all the way back so you take a guess. | This time, you already knew where the monsters were{wakeUp == 2:, thanks to that vision}. The lakeside forest. You figure your best plan is to try going there.{wakeUp == 2 and previous_death == "monsters": Though you are still a bit weary of those monsters.}}
        + (DarkForest) [Head to the dark forest.]
            {knowledge ? monsterLocation: 
            -> DarkForestInterrupt
            - else:
            -> theDarkForest
            }
            - - (theDarkForest)
            {DarkForest == 1:
            Monsters. Dark forest. They'd have to be there right? Granted it probably was the most dangerous place outside of town to go, but it was also probably the most likely place for those monsters to be hiding. You start heading in the direction of the dark forest.
            }
            You arrive fairly quickly. As the name implies, it was certainly dark, even in daylight. The trees overhead were so thick they blocked out nearly all light. You could hear the faint howling and snarling of beasts deep into the woods. All around the floor, you could see tracks of various different creatures that must roam the area. {not (knowledge ? monsterLocation): You must have guessed correctly. Time to start hunting for those monsters.}
            {GoTowardsHowling and GoTowardsTracks: Besides, either way, you knew you'd end up running into those wolves again.}
                + + (GoTowardsHowling) [Move in the direction of the howling.]
                {GoTowardsHowling == 1:
                You start heading in the direction of the howling, climbing over the thick bundle of roots and foliadge along the forest floor. As you do so, your foot gets caught on a root and you end up tumbling forwards onto the ground. All the sounds of the forest come to a halt. That doesnt seem good.
                - else:
                Following the sounds of the howling, you knew you'd eventually find the wolves that lurked in these woods, for better or worse. Unlike some previous attempts{wakeUp == 2:, within that strange premonition,} you are careful enough not to trip over the thick bundle of roots along the forest floor as you proceed.
                }
                -> wolfEncounter
                + + (GoTowardsTracks) [Follow the tracks on the forest floor.]
                {GoTowardsTracks == 1:
                You start following the tracks on the forest floor, pealing back foliadge to make sure you stay on the right trail. The forest floor was thick with roots and fallen branches. It really was a matter of time before you-
                Your foot gets caught on an upraised root,and you tumble forwards onto the ground. All of the sounds of the forest come to an immediate silence. That doesnt seem good.
                - else:
                Following those tracks that snake through the forest, you knew you'd eventually find the wolves that lurked in these woods, for better or worse. Unlike some previous attempts{wakeUp == 2:, within that strange premonition,} you are careful enough not to trip over the thick bundle of roots along the forest floor as you proceed.
                }
                -> wolfEncounter
                
        + (LakeForest) [Head to the lake forest.]
            {LakeForest == 1: You know there's a lakeside forest not all too far from here. There were quite a few hiding spots near the water where monsters would often stay. This seemes like the most likely place for them to be, so you head in the direction of the lake.}
            When you arrive, you look out onto the glittering surface of the water as it reflects off the morning sun. It was awfully peaceful here, it almost felt like you wouldn't find anything monstrous here at all. {not (knowledge ? monsterLocation): But of course, you decide to look around anyways.}
                + + [Continue.]
                   {LakeForest == 1:  
                   You look around the surrounding woods by the lakeside. For a long while, you're worried that you might have guessed incorrectly, that is, until you come across the remains of what appears to be some sort of camp. Theres a scattered pile of burnt wood, surrounded by what appers to be tattered tents and supplies. And also blood smeared all over the ground. You pick around in the wreckage and even find a mangaled human foot. A shudder runs down your spine. The monsters must be here.
                   - else:
                   You remember looking around this location before and finding that wrecked campsite. You beeline straight for it through the trees, and find it in the same state{wakeUp == 2: as it was in that vision}.
                   }
                    + + + (WaitAtCamp)[Wait at the camp.]
                    {WaitAtCamp == 1: 
                    You decide to wait at the camp. You'd rather let the monsters come to you than you to them. Surely they'd come back eventually if they'd been here before.
                    You wait and wait, but nothing shows. For a moment, you think that this might not have been the work of monsters after all. You get up, ready to search somehwere else.
                    -else:
                    {wakeUp > 2: 
                    You've done this before. You knew the monsters's wouldn't come, but, you knew that HE would. So, rather than waiting for monsters, you waited for that man to show up here at this location to kill you, again.
                    - else:
                    You weren't sure why, but you decided you would wait here again, just as you had done in that vision. You remember being stabbed in the back, but this time, you would be ready, or so you hopped. {has_weapon: You clutch onto your dagger, sitting down on a nearby log, and wait.}
                    }
                    }
                    -> job1Failure
                    + + + (SearchNearby) [Search nearby.]
                    {SearchNearby == 1:
                    You look nearby, hoping to find more evidence of where the monsters might have gone. Eventually, you come across the entrance of a cave tucked into the side of a hill. There are piles of bones scattered around the entrance. This must be where they are.
                    - else:
                    You already knew where the monsters where. They were back in that cave filled to the brim with bones, not all to far from this camp. You head in that direction{wakeUp == 2:, the one you remember from that vision}.
                    }
                         + + + + (SearchInsideCave) [Search inside.]
                         {SearchInsideCave == 1: 
                         You creep inside of the cave, hoping to find the monsters still inside. Your footsteps are near silet.
                         Until you hear a harsh snap. You freeze in place and look down. You see a small white bone shattered underneath your foot.
                         Further into the cave, you hear the sound of claws scraping against stone and the sound of low gutteral growling.
                         - else:
                         You'd been in this cave before, you knew the monsters still lurked inside. Slowly, you creep into the cave, careful not to make any noise.
                         But, even as deathly silent as you were, those monsters could still smell you. As soom as you got close, you could already hear them start to growl and paw at the stone floor with their razor sharp claws.
                         }
                         -> monsterEncounter
                         + + + + (LureOutsideCave)[Lure them out.]
                         {LureOutsideCave == 1:
                         {SearchInsideCave >= 1: Knowning how it went the last time you decided to search inside the cave itself, you'd rather not go in again.}
                         Rather than risk going inside of the cave, you instead choose to try and lure the monsters out. Crouching down in the nearby brush, you reach down to grap a handful of pebbles and hurl them towards the entrance of the cave.
                         Almost imediately you hear the sound of claws scraping against stone and low gutteral growling as the monsters are roused from within the cave.
                         - else: 
                         Once again, you attempt to lure the creatures out of the cave using the same strategy as before. You grab a handful of rocks and hurl them towards the entrance of the cave. Rather than hide in a nearby bush though, you move closer to the entrance, to suprise the monsters when they emerge{has_weapon:, your hand ready to reach for your dagger}.
                         }
                         -> monsterEncounter
            -> job1Failure
    
        + (SwampForest) [Head to the swamp forest.]
            {knowledge ? monsterLocation: 
            -> SwampForestInterrupt
            - else:
            -> theSwampForest
            }
        - - (theSwampForest)
        {theSwampForest == 1:
        The swamp? Maybe, might as well check. At least it sounds at least a bit more welcoming than the dark forest. You start heading in the direction of the swamp.
        }
        You know you made it there when you take a step and your foor sinks into the ground, and you can feel hordes of bugs starting to hone in on your location, crawling all over your arms. You swat them away, barely a moment to rest before more start to swarm you. You have half the mind to just go back, but you were already here{not (knowledge ? monsterLocation):, so might as well keep checking}
        {theSwampForest == 1:
        You look around for a while, not really finding anything other than bugs and mud and half-dead trees. With a sigh, you decide to head back.
        But when you start to take a step, you realize your foot is stuck. You pull and yank on your leg, but you're stuck in the mud, the bugs still nearly eating you alive. Thats a problem.
            + + [Try to pull up on the nearest branch.]
            You stretch your arm out, trying to latch onto a tree branch hanging nearby. When you finally get a hold up it, you give it a swift tug.
            And the branch snaps in two. Well then.
            -> stuckInMud
        - else:
        You wander around for a while, this time, much more careful so as not to get yourself stuck in the mud pathetically again. That really was an embarassing way to go you think with a grimace.
        Again, there really isn't much here. You don't find anything but the bugs.
        After wander around for a while, you decide to head back, or at the very least actually go to where the monsters are located.
        -> job1Failure
        }
    
    - (wolfEncounter)
    {wolfEncounter == 1:
    But then, just a few feet from you, that snarling sound that you were following starts up again. You look up, slowly, and find yourself face to face with the fangs of a creature, its maw dripping with saliva as it growls at you, its breath stinging your face... wait, this isn't even the monster you were searching for. It was just a regular wolf. Big, with matted fur and razor sharp fangs, but still just a wolf.
    But it wasn't alone. There was a whole group of them, looking equally as vicious standing right behind it.
    - else:
    Well, now that you weren't falling on your face in the middle of the woods, you were able to get closer to the wolves without being detected. There was a group of them, though not too many that you couldn't handle it. You could fight them off, or simply just run away if you felt like it. Besides, as soon as you got to the edge of the forest, they weren't going to risk following you past it.
    }
                + {wakeUp == 1 or has_weapon} [Reach for your weapon.]
                {wakeUp == 1:
                    You slowly reach behind your back, and grasp at air. Your eyes widden. When had you lost your dagger? Your mind swirls, thinking back at everything that had happened today. Was it when {char1} knocked you over? Had you been stupid enough to leave it at the inn?
                    ~knowledge += lostWeapon
                    Well, looks like you have no other choice.
                        + + [Start running.]
                        -> Run1
                - else:
                    You decide you ought to take them down. No, these weren't the monsters that you had intended to fight when you took on this job, but hey, maybe you'd get paid for it anyways. Wishful thinking you suppose.
                    You pull your dagger from its sheath and throw it at the wolf nearest to you, downing it fairly easily. But as it tumbles it the ground, the other wolves notice your presence immediately. 
                    You rush forwards to reclaim your dagger, just as one of the other wolves reaches you. You quickly move your head out of the way of its fangs chomping down on your head, and fell this one as well.
                    The remaining two are tougher, as they gang up on you, but luckly, you are able to take them down with just a few scratches.
                    + + [Continue]
                    Once that is dealt with, you head out of the forest, hoping to go back to town and claim some sort of reward for it. Or at least sell some of their hide for profit.
                    -> job1Failure
                }
                + (Run1) [Start running.]
                {wolfEncounter == 1:
                    You laugh nervously. "Ha ha, good doggy?"
                    The wolf lunges at you and you barely dodge backwards fast enough to avoid it biting your head off, its jaws luckily snapping close on nothing but air. 
                    You scramble to your feet without a moments hesitation and start running back the way you came. You hear the wolves hot on your trail, snapping and growling at you, their claws pounding against the forest floor.
                    With your lungs burning, you reach the edge of the trees and make it out of the forest. You look back to see the wolves all slide to a stop, not daring to exit the forest. They prowl the treeline for a moment before slinking back into the shadows.
                    You let out a breath, feeling relieved.
                        + + [Continue]
                        -> job1Failure
                - else:
                You decide against it. The wolves still haven't seen you, and you don't really want to cause any trouble. Instead, you quietly run back out to the edge of the forest without them noticing.
                What a waste of time, you think.
                    + + [Continue]
                    -> job1Failure
                }
                        
                        
    - (monsterEncounter)
    {monsterEncounter == 1:
    Within moments, the sound of those claws against the stone quickens, as you realize the monsters have already started running towards you. You're about to take a step back before you see the heads of those creatures emerge from the shadows. These were definitely the right ones.
    They spot you within moments, their glowing red eyes turning over to you, sending a chill down your spine. This job certainly sounded easy in theory, but you were starting to have doubts.
    - else:
    Within mere moments, you hear the sounds of those monsters racing straight towards you. No matter what you did, they always seemed to realize that you were there. {has_weapon: Luckily for you, you were smart enough to have a dagger on hand this time}. 
    }
        + {wakeUp == 1 or has_weapon} [Reach for your weapon.]
            {wakeUp == 1: 
            You slowly reach behind your back, and grasp at air. Your eyes widden. When had you lost your dagger? Your mind scrambles, thinking back at everything that had happened today. Was it when {char1} knocked you over? Had you been stupid enough to leave it at the inn?
            ~knowledge += lostWeapon
            Well, looks like you have no other choice.
                + + [Start running.]
                    -> Run2
            - else:
            -> jobOneSuccess
            }
        + (Run2) [Start running.]
        You really couldn't fight them after all. {has_weapon: Even with your dagger on you, you really were a coward. | {wakeUp > 1: Why had you left your weapon behind? That was really dumb, you realize. Is not like you were going to wrestle these things to death.}}
        You turn around and start running, practically tripping over yourself. 
        The speed of those monsters steadlily increases behind you, they wer nearly at your heels, snapping and clawing at you as you ran.
        You weren't going to make it. They were much too fast.
            + + [Continue.]
            ~knowledge += job1Failed 
            ~previous_death = "monsters"
                Within seconds, you feel a monster pounce of you, its claws tearing into your back. You let out a scream of pain, only to be met with the sound of the creatures howling in delight.
                The strength fades from your body quickly, as the monsters begin to feast.
                {Run2 > 1: You aren't quite sure why you keep letting this happen.}
                Your vision fades to black.
                + + + [Wake up.]
                    -> wakeUp
                    
    - (stuckInMud)
        + [Try to get out.]
            {stuckInMud < 5: 
            You twist and turn trying to get your leg unstuck, water sloshing all around you, but it doesnt budge.
            - else:
            This really isn't going to work.
            }
            -> stuckInMud
            + [Yell for help.]
            -> Yell1
        + (Yell1) [Yell for help.]
        With not much of an option, you start to yell for help. There probably wasn't anyone nearby, but what other choice did you have? 
        You yell and yell and yell, but no one comes. Its just you and the bugs.
        + + [Continue]
        -> job1Failure
    
    - (job1Failure)
    ~killed_by_assassin += 1
    ~previous_death = "assassin"
    ~knowledge += job1Assassin
    {job1Failure == 1 or not (knowledge ? job1Success):
    That is, until you feel a sharp pain in your chest. {killed_by_assassin > 1: No, no, no! Not again!}
    "Wha-"
    You look down to see a sword piercing through your chest, covered in blood.
    You reach up, your hands shaking as the corners of your vision starts to fade.
    And then everything turns black.
    {wakeUp == 2: Even after that vision it all ends the same.}
    - else:
    {jobOneSuccess == 1:
    That is, until you feel a sharp pain in your chest.
    {killed_by_assassin > 1: There was no way. NO way.}
    "Wha-"
    You look down to see a sword piercing through your chest, covered in blood{killed_by_assassin > 1:, a sight you'd seen before.}.
    You reach up, your hands shaking as the corners of your vision starts to fade.
    Even if you managed to do the job, you ended up loosing anways.
    What did you do to deserve this?
    Your vision quickly fades to black.
    {wakeUp == 2: Even after that vision it all ends the same.}
    - else:
    You could feel it. Well not feel it, but you'd just experienced this enough times by now that you knew.
    That figure was sneaking up behind you at this very moment. You keep listening, trying to determine where they would come from, but you here nothing other than the sounds of the forest.
    Where were they? You could never tell, not until they were practically on top of you.
    {knowledge ? (job1Success, job2Success) and killed_by_assassin >= 3 and not (knowledge ? assassinAppearance):
    At least this time around, you hoped you might get a look at their face. That was your only hope in trying to find them before they found you the next time you woke up.
    }
    And then, the smallest sound, the noise of metal sliding from its sheath directly behind you.
    You wirl around{has_weapon:, dagger in hand, even though you knew it was pointless}.
    You dodge quickly to the side, the stab from the assailent's sword narrowly missing your heart, instead embedding itself into your shoulder, sending pain all throughout your arm.
    Their next blow wouldn't miss, even if you knew where it came from, you simply weren't fast enough.
    They strike again before you can even react, sending their blade straight throught your heart once more.
    You cough up blood, it spilling down your front onto the ground below.
    {knowledge ? (job1Success, job2Success) and killed_by_assassin >= 3 and not (knowledge ? assassinAppearance):
    As you vision fades, you take what little time you have to note their appearance before you wake up once more. they were covered from head to toe in a black cloak, a hood over their head and the lower half of their face covered. What you could see though, hidden in that darkness, where a pair of silver eyes filled with malice, and a few strands of black hair.
    When you wake, you pray you might stand a chance of finding them before they get to you. To end this horrid loop.
    ~knowledge += assassinAppearance
    }
    Your vision fades to black.
    }
    }
    + [Wake up.]
        -> wakeUp
        
    - (jobOneSuccess)
    ~knowledge += job1Success
    You reach for your dagger, slowly, as not to draw to much attention to yourself. When the monster's get closer, their glowing red eyes within sight, you lunge at them.
    The monsters are quick, but you are quicker. The first one doesn't react to your presence in time, and you bury a dagger in its neck, it yowling out in pain and collapsing to the floor in a heap.
    You yank out yor dagger, ready for the next one, and dodge at its swipes, dodging underneath its claws and slashing at its underside. You quickly crawl out of the way as the second falls to the floor as well.
    {jobOneSuccess > 1: Same old story.}
    {jobOneSuccess == 1:
    Wow, this really WAS pretty easy. You actually managed to do it{knowledge ? job1Failed: this time}! {knowledge ? job1Assassin: Luckily you didn't run into whoever it was that stabbed you in the back in that vision!}
    Anyways, after dealing with that, you decide you out to head back and collect your reward money. {wakeUp == 2: Thanks to that vision last night, it ended up being a piece of cake.}
    - else:
    But you knew, that after this, you'd get snuck up on by that mysterious figure, just as you had before in all other versions of this day. {killed_by_assassin >= 3: But really, at this point, you were aware that you didn't stand a chance. They were far above your skill level, even if you ran.}
    }
        + [Continue]
        -> job1Failure
    
    
    = jobTwo
    You decide to go with the second option. It doesn't give all too much information, but it does give you enough where you could probably track down this mercenary no problem. You head out of town, following the road to the next town over where it says that he was last spotted. 
    {jobTwo == 1:
    Not too strangely, this town wasn't all too different from the one that the guild was located in, mainly in that it was filled with similarly suspicious types. However, in this case it wasn't only crimminals and other unerworld sorts of folk around here, but there were also just regular citizens about too.
    Not making yourself too obvious, you walk through the town for a while, seeing if theres anyone who might fit the description of the man you were looking for. This did mean you got to see a fair bit of the town. What you did see wasn't all that great. In the darkest corners of town, you saw a few instances of townsfolk getting haggled for cash and robbed. Quite a few black market deals as well. Just like home, you thought bitterly. Though at least here people didn't go around blatantly fighting eachother out in the open, for better or worse.
    }
        + [Continue]
            {jobTwo == 1:  
            After a while of searching, the sun now setting, you find a man wearing a heavy cloak. Not all too much more suspicious than the other types of people around, but he fit the description well enough. You figure it was worth a shot. 
            You follow him around for a while, careful to not make yourself seen on the chance that he looked back and saw you tailing him. Eventually, he enters a tavern. Just as you're about to follow him inside you hear a scream coming from behind you. That scream sounded to be from someone young. You stop in your tracks. If you let the man go, you might have trouble finding him again. But...
            - else:
            Since you already knew that the mercenary would end up at the tavern later in the day{wakeUp ==2:, as you had seen in that vision,} you decide to loiter nearby during the day, waiting until he finally showed up. Once the sun started to set, you see the man. You hide behind the corner, waiting for him to enter. Just as you are about to follow him inside, you remember.
            A scream. A child's scream. {HelpChildren == 0: You still feel guilty about it, that you hadn't tried to help them before.}
            But now you knew, that mercenary would be there for a while, waiting for that person that he was meeting. So, if you wanted to you could try and save those kids.
            {HelpChildren > 0: Though from past experience, you remember having gotten stabbed in the back just after saving them. But, maybe it was worth it. {HelpChildren == 1 and not (knowledge ? (job1Success and job2Success)): Besides, this time, at least you knew, and surely would be more prepared.}}
            }
                + + (HelpChildren) [Help the children in trouble.]
                {HelpChildren == 1:
                    You sigh. Against your better judgement you turn around, and sneak into the alley behind you. Guess you probably weren't getting paid today.
                    }
                    When you peak around the corner of the building, in the shadows you see is two young children cornered by a man holding a knife. One of the children stands in front of the other, who is clutching desperately onto a basket. 
                    You couldn't just leave this be.
                        + + + {wakeUp == 1 or has_weapon} [Reach for a weapon.]
                        {wakeUp == 1:
                        ~knowledge += lostWeapon
                        You reach behind your back to pull out your dagger, only to grasp at thin air. Oh. You didn't even have a weapon with you. Where had you lost it? Was it when {char1} bumped into you earlier? Or had you really been stupid enough to leave the inn without making sure you had it? Well, you suppose you'll have to risk going in without a weapon.
                                + + + + [Use your fists.]
                                    -> Fists1
                        - else:
                        You pull your dagger from its sheath. You don't necessarily want to kill the man, but you do want to scare him of at least.  
                        Quietly, you sneak up behind the man, whose back is turned to you, and before he has time to realize you're there, you grab the arm holding the knife and slam it into the wall next to you.
                        You then hold your dagger up to his throat. He freezes.
                        You think about pulling your rank as a member of the Assassin's Guild, to really freak him out. {YourRank: Even if your actual ranking in the guild wasn't impressive, he didn't need to know that.}
                        "Leave these kids alone," you growl, pressing your dagger against the man's throat.
                        The man is breathing heavily, "Why the hell should I?"
                        You smirk to yourself, this was what you were waiting for.
                        "I'm a member of the Assassin's Guild a town over. Do you really want to mess with me?"
                        You can feel him stiffenn in your grasp. He stays silent.
                        "Now get the hell out of here before I change my mind and decide to kill you right here."
                        You release him and he scampers off.
                        Wiping your hands together, you put your hands on your hips, rather proud of yourself, and turn towards the two children.
                        "You two all right?"
                        All they do is look at you, well, more like behind you, a growing fear creeping up on their faces.
                        You had almost forgotten.
                        -> job2Failure
                        }
                        + + + (Fists1) [Go in with your bare-handed.]
                        {has_weapon: Eh, you really didn't need your dagger to deal with this guy. He was just some common theif anyways. {HelpChildren > 1: Which was blatantly clear given the previous times you dealt with this situation.}}
                        Quietly, you sneak up behind the man, whose back is turned to you, and before he has time to realize you're there, you grab the arm holding the knife and slam it into the wall next to you. The knife clatters to the ground, and as he starts to turn around to face you, you take an elbow and slam it into his face. He drops to the floor like a sack of brinks. Wiping your hands together, you put your hands on your hips, rather proud of yourself, and turn towards the two children.
                        "You two all right?"
                        All they do is look at you, well, more like behind you, a growing fear creeping up on their faces.
                        {HelpChildren > 1: You had almost forgotten.}
                        -> job2Failure
                + + (FollowMercenary) [Keep following the man.]
                {FollowMercenary == 1:
                    Though part of you regrets it, you couldn't risk losing the money for this job. You follow the man inside. 
                    The tavern was certainly busy, with all sorts of people milling about.
                    You watch the man move to the back of the room, finding a seat. He appeared to be sitting alone. At least for now. There were a lot of people around, but because of that, no one would notice you. And no one would notice what happened in the back of the room.
                    You move through the crowd, finding a table not to far from him. You could deal with this now, or you could wait till he leaves. He doesnt appear to have noticed you yet. 
                    - else:
                    {HelpChildren >= 1: You remember the last time that you'd tried to help in and all it had landed you was a sword in your back. {FightMercenary >= 1: Granted, you suppose that had also happened when you tried to deal with the mercenary, but still.}}
                    You walk inside the tavern, and without needing to look, walk over to the back table nearby where the mercenary was sitting. This time, you feel you were much more subtle, your attention not even having needed to be so focused on him this time around.
                    {has_weapon: You could deal with this now, or you could wait till he leaves.|Without your weapon, you'll need to wait till he leaves to get the job done.}  He doesnt appear to have noticed you yet, but the person he's meeeting with might be there soon.
                    }
                        + + + {wakeUp == 1 or has_weapon} [Reach for a weapon.]
                        {wakeUp == 1:
                        ~knowledge += lostWeapon
                        You reach behind your back to pull out your dagger, only to grasp at thin air. Oh. You didn't even have a weapon with you. Where had you lost it? Was it when {char1} bumped into you earlier? Or had you really been stupid enough to leave the inn without making sure you had it? Well this complicates things. You suppose you really will have to wait for him to leave, hopefully alone, and deal with him then.
                                + + + + [Wait for him to leave.]
                                -> Wait1
                        - else:
                        Your stomach turns. This was it. This was that dirty assassin work that you had signed up for. You'd done it before, but you didn't exactly love it. 
                        You pull your dagger from its sheath underneath the table, as quietly as you can, and fold it into the inside of your cloak.
                        You stand up, making your presence as unnotable as possible, and start walking towards the direction of the table that the man is sitting at. His eyes are too focused on the front door to see you, as you walk past.
                        As you walk behind his chair, you slip out your dagger. 
                        When you do, you notice the man's attention turn towards you and his eyes widden.
                        Just as he starts to reach for the weapon at his side, you slide your dagger into the side of his neck, and pull it back out. He was fast, but you were faster.
                        You walk away swiftly as his body thumps onto the table behind you. Blood spilling out across the table and onto the floor.
                        Just as you slip out the front door, you hear a scream as someone notices what has happened. It certainly wasn't an uncommon occurance around here, but you make your way into an alley to find a way out of the town undetected.
                        Your next move was to make your way back to th eguild to collect your payment. {knowledge ? job2Success:; hopefully, before that mysterious figure finds you like they had the last time.}
                        -> jobTwoSuccess
                        }
                        + + + (Wait1) [Wait for him to leave.]
                        {Wait1 == 1:
                        You sit at your table making sure to keep an eye on the man not to far away. You realize it would definitely look a lot less supicious if your ordered something to drink but, thinking back on the reason you didn't have any money in the first place, you shrink back in your chair.
                        After a while, somone else comes and sits at the table accross from the man. The two have a short conversation, exchange something, and then the leave, the man once again sitting alone at the table. He slips something in his pocket before getting up to leave as well. Now you really didn't care what that whole conversation was about, it wasn't exactly in your job description, but you were just glad he seemed to be leaving by himself.
                        You follow quietly after him. Back outside you watch him slip into an alleyway. What a shocker.
                        Just as you are about to follow after him, you feel something cool press against your throat.
                        - else:
                            You sit at your table making sure to keep an eye on the man not to far away. The last time you did this, he had noticed you were watching him, but surely this time you were being sneakier. Or at least you were trying to.
                            As expected, after a while, someone else comes in and sits across from the mercenary, the two have some sort of exchange, and then they leave.
                            The mercenary slips something into his pocket and gets up to leave.
                            You follow quietly after him. Back outside you watch him slip into an alleyway. 
                            Just as you are about to follow after him, you feel something cool press against your throat. Wait, really? Again? You could have SWORN you were being inconspicuous. You really wonder how you landed yourself with this proffession in the first place.
                        }
                            + + + + [Continue]
                            {Wait1 == 1: 
                            Ah, a knife, wonderful.
                            "Alright, what's all this about again?"
                            You feel the knife press closer against your throat. {not has_weapon: You squirm a bit. You really wish you had a weapon on you right about now.}
                            A gravely voice growls into your ear, "Don't get cocky."
                            You laugh nervously, "Ha ha, of course not."
                            "Why the hell are you following me?"
                            You thought you'd been sneaky enough, but apparently not. {YourRank: Some ranked 839 assassin you were, you laugh quietly to yourself.}
                            "Thought it'd be fun, really."
                            You feel a sting on your neck, and something warm slide down your neck.
                            "Answer the question, or I'll kill you right here. No playing around."
                            Were you really going to die here?
                            - else:
                            Were you really going to have to do this song and dance again?
                            You stay quiet. You were really getting tired of this to be completely honest.
                            "Why the hell are you following me?" he growls into your ear.
                            }
                                + + + + + (FightMercenary) [Fight back.]
                                {Wait1 == 1:
                                In a last ditch effort, you step down hard on the inside of his foot. He staggers and grunts in pain, just enough for you to move your arms between the knife and your neck. You feel another sharp sting as he slices along your arm. Better than the alternative. 
                                You turn around to face him, but he'd already started backing away from you.
                                You laugh tauntingly. Were you really that fearsome?
                                That was, until you notice him looking at something behind you. He almost looked afraid even.
                                - else:
                                {FightMercenary  > 1: You'll have to make it quick this time. The last time you ended up getting stabbed in the back in the middle of this fight.{knowledge ? (job1Success, job2Success): By that assassin who's been following you every time you've started this day over.}}
                                You step down on the inside of his foot, him of course, staggering back and grunting in pain.
                                {not has_weapon: 
                                You move your arms between the knife and your neck. You feel another sharp sting as he slices along your arm. Better than the alternative. 
                                You turn around to face him, but he'd already started backing away from you.
                                Oh of COURSE.
                                - else:
                                You quickly pull out your dagger with one hand and move it to block your neck. You hear a slash of metal against metal as his knife collides against your dagger. You wirl around and jab your dagger between his ribs, jumping back before he has the chance to retaliate.
                                He tries to slash out as you, a hand clutching his side, but after a moment, he collapses onto the ground, blood pooling around him.
                                You glance around in all directions, looking for that assailent{wakeUp == 2: from the vision}, but you see no one.
                                Taking that as your chance to escape, you begin running back in the direction of your town. Now that you'd been able to kill the mercenary, you'd be able to collect the bounty.
                                -> jobTwoSuccess
                                }
                                }
                                -> job2Failure
                                + + + + + (LoseToMercenary) [Make something up.]
                                ~previous_death = "mercenary"
                                ~knowledge += job2Failed
                                {LoseToMercenary == 1:
                                "Ah ha, well to be honest..."
                                You trail off, what were you going to say to convince him.
                                "I just uh... thought you were cute?"
                                Nicely going.
                                He aparently didn't find that all too funny, as he drags the knife accross your throat without hesitation.
                                You fall forwards, clutching at your neck as the life spills out of you.
                                Its no long before your vision fades to black.
                                - else:
                                You know what, you give up. {wakeUp == 2: Whatever that vision was telling you, you supose you'd fallen back into the same trap.}
                                "I'm actually an assassi-"
                                He doesn't even let you finish this time. He drags the knife accross your throat without a moment's hesitation.
                                You fall forwards, clutching at your neck as blood slips between your fingers.
                                Very nicely going, you think.
                                Its no long before your vision fades to black.
                                }
                                    + + + + + + [Wake up.]
                                    -> wakeUp
                                    
            - (job2Failure)
            ~killed_by_assassin += 1
            ~previous_death = "assassin"
            ~knowledge += job2Assassin
            {job2Failure == 1 or not (knowledge ? job2Success):
            Before you have a chance to react, you feel an agonizingly sharp pain stab through your chest. {killed_by_assassin > 1: Damn it! Not again!}
            "Wha-"
            You hear the sound of something dripping down on the cobblestones in front of you.
            You look down, your vision already starting to fade, only to see a blade protruding outwards from your chest, covered in blood. 
            You watch as the blade slowly slides backwards. You try to turn your head to see the perpetrator, but your vision fades to black.
            {wakeUp == 2: Even after that vision it all ends the same.}
            - else:
            {jobTwoSuccess == 1:
            As you attempt to make your way back into town having completed the job, you feel a... presence come near you.
            But before you have any time to react, you feel an agonizingly sharp pain stab straight through your chest.
            {killed_by_assassin > 1: It-it couldn't be. Not again. Not after finally getting this job done.}
            You look down, slowly, only to see the edge of a sword piercing through you, blood seeping through the front of your cloak and spilling onto the cobblestone below.
            You're hands tremble, reaching up to it.
            Even when you didn't fail the job, you were still found and killed.
            What did you do to deserve this.
            Your vision fades to black as you feel your body fall forwards.
            {wakeUp == 2: Even after those warnings from the vision, it ended the same, with you dying on the ground.}
            - else:
            You could feel it. Well not feel it, but you'd just experienced this enough times by now that you knew.
            That figure was sneaking up behind you at this very moment. You keep listening, trying to determine where they would come from, but you here nothing other than the sounds of the forest.
            Where were they? You could never tell, not until they were practically on top of you.
            {knowledge ? (job1Success, job2Success) and killed_by_assassin >= 3 and not (knowledge ? assassinAppearance):
            At least this time around, you hoped you might get a look at their face. That was your only hope in trying to find them before they found you the next time you woke up.
            }
            And then, the smallest sound, the noise of metal sliding from its sheath directly behind you.
            You wirl around{has_weapon:, dagger in hand, even though you knew it was pointless}.
            You dodge quickly to the side, the stab from the assailent's sword narrowly missing your heart, instead embedding itself into your shoulder, sending pain all throughout your arm.
            Their next blow wouldn't miss, even if you knew where it came from, you simply weren't fast enough.
            They strike again before you can even react, sending their blade straight throught your heart once more.
            You cough up blood, it spilling down your front onto the ground below.
            {knowledge ? (job1Success, job2Success) and killed_by_assassin >= 3 and not (knowledge ? assassinAppearance):
            As you vision fades, you take what little time you have to note their appearance before you wake up once more. they were covered from head to toe in a black cloak, a hood over their head and the lower half of their face covered. What you could see though, hidden in that darkness, where a pair of silver eyes filled with malice, and a few strands of black hair.
            When you wake, you pray you might stand a chance of finding them before they get to you. To end this horrid loop.
            ~knowledge += assassinAppearance
            }
                Your vision fades to black.
            }
            }
                + [Wake up.]
                -> wakeUp
                
            - (jobTwoSuccess)
            ~knowledge += job2Success
            -> job2Failure
                
    
    = tavern
    -> END
    
    =searchForBird
    -> END
    
    =ending
    ->END

-> END
