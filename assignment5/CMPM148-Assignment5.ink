// CMPM 148 - Assignment 5: Time Loop Game


// CHARACTER NAMES (listed as variables so they can be easily changed)
VAR protag = "Kiran"
VAR protagNickname = "Kir"
VAR char1 = "Rivin"
VAR char1bird = "Crowly"
VAR char2 = "Aeula"

// VARIABLES
// variables which persist across loops
LIST knowledge = bird, lostWeapon, monsterLocation, job1Failed, job1Success, job1Assassin, job2Failed, job2Success, job2Assassin, assassinAfterYou, assassinAppearance, needHelp, birdLocation, color
VAR killed_by_assassin = 0
VAR checking_char2_ranking = false
// variables used per each loop that reset
VAR actions_this_loop = 0
VAR has_weapon = false
VAR face_cut = false
VAR previous_death = "default"
VAR char1_in_party = false
VAR char2_in_party = false
VAR looking_for_bird = false
VAR bird_found = false
VAR questions_right = 0
VAR char2_rejected = false


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
~char1_in_party = false
~char2_in_party = false
~looking_for_bird = false
~bird_found = false
~questions_right = 0
~char2_rejected = false
// begining of time loop
{previous_death == "char2": Your eyes snap open and you fly upwards in bed gasping for air. What had even happened? The last thing you remember is talking to {char2} but then she got angry at you and then-<br><br>Did she... did she actually kill you? Seriously? Well, at least it wasn't the assassin who killed you this time, you think, sighing out loud. You make a note not to piss her off again. |When you awaken, still bleary eyed, you are met with the sight of the half-rotted wooden ceiling of the inn that you'd spent the night in, sunlight staring to stream in from the window. {wakeUp > 3: This was starting to get a bit tiring. {wakeUp > 6: You honestly wanted to just lie in bed and not have to deal with this day ever again, but you needed to deal with this somehow or it was never going to end.{killed_by_assassin > 6: This assassin was really getting on your nerves. Why did they want you dead so badly? And why were they so damn strong?}}}{wakeUp == 3: Okay, all of this was starting to get a bit repetitive. Even now, you could still feel those faint traces of pain in your body from that part of your dream before you woke up.<br><br>No, this wasn't a dream. It was something else, it had to be.}{wakeUp <= 2: You sit up in the creaking bed, your head still{wakeUp == 1: pounding from the night before. Yeah, you might have went just a bit overboard. You don't really remember anything that happened last night other than the fact that you definitely spent all of the money you had gotten from that last job you did. Already. And probably then some. |{wakeUp==2: - wait. <br><br> Actually, your head didn't really hurt all that bad. Which was suprising considering the night before. But, even though your head wasn't hurting,{previous_death == "assassin": you could still feel this intense stabbing pain in your chest.}{previous_death == "monsters": you could still feel this intense stinging pain lacing all throughout your back.}{previous_death == "mercenary": you could still feel just the slightest twinge of pain arching across your neck.} But, why was that? You think back to the last thing you remember. Although a bit foggy, you could still remember pieces of that dream you had. Hadn't you... died at the end of that dream, just before you woke up? You can just barely remember it. Sure, it had felt pretty damn realistic, but why were you still feeling that pain now? Strange.}}}}
You try to rub the sleep out of your eyes and roll out of bed with a groan{wakeUp > 1:, your body still aching all over}. {wakeUp == 1: You stand up for a moment, waiting for the pain in your head to subside. You stand there, just staring at the wall, swaying slightly, eyes half closed with a blank expression on your face. When you think you've mustered enough strength, you take a step. But you're immediately met with the hard wooden floor as your legs give out from under you.<br><br>"Well shit," you mutter under your breath, the sound muffled by your face pressed against the floor.|{wakeUp == 2: Really, why didn't your head hurt but everywhere else did? What did you do last night? You think about that dream again. It really was so strange. You shake off the memory and decide to go downstairs and head out for the day. You needed to try and get more money after you blew it all off yesterday.}}{wakeUp == 3: Well, if none of this was a dream, what were you supposed to do? {knowledge ? job1Success and not (knowledge ? job2Success): You had tried doing that monster hunting job, and even though you had been able to take those monsters down it, you ended getting stabbed in the back. You suppose your only choice now it to try that other job.}{knowledge ? job2Success and not (knowledge ? job1Success): You had tried dealing with that mercenary, and even though you'd managed to do it, you just ended up getting stabbed in the back. You suppose your only choice now was to try and do that other job.}{not (knowledge ? job1Success) and not (knowledge ? job2Success): You still haven't even managed to complete either of those jobs yet. Surely with the knowledge you have now you ought to be able to complete at least one of them.}}
{wakeUp > 3 and not (knowledge ? assassinAfterYou): 
You still needed to figure something out. 
{knowledge ? job1Success and not (knowledge ? job2Success): You had tried doing that monster hunting job, and even though you had been able to take those monsters down it, you ended getting stabbed in the back. You suppose your only choice now it to try that other job. You needed, at the very least, to confirm wether whoever had stabbed you in the back was actually being sent after you or not.}
{knowledge ? job2Success and not (knowledge ? job1Success): You had tried dealing with that mercenary, and even though you'd managed to do it, you just ended up getting stabbed in the back. You suppose your only choice now was to try and do that other job.  You needed, at the very least, to confirm wether whoever had stabbed you in the back was actually being sent after you or not.}
{not (knowledge ? job1Success) and not (knowledge ? job2Success): You still haven't even managed to complete either of those jobs yet. Surely with the knowledge you have now you ought to be able to complete at least one of them without getting killed.}
}
{knowledge ? (job1Success, job2Success) and not (knowledge ? assassinAppearance): 
At this point, you were sure, absolutely sure that an assassin was after you.
~knowledge += assassinAfterYou
There wasn't a doubt in your mind anymore. Even after completed both of the jobs, that dammned assassin STILL found you.
If you were going to do anything about it, you needed to find out what they looked like. Maybe, just one more time, you ought to tempt them into killing you, that might be the best shot that you had. To try and get a glance at them before they finished you off so that the next time you enetered one of these loops, you might try to find them before they find you.
}
{knowledge ? assassinAppearance and not (knowledge ? needHelp):
This time. This time you knew what they looked like. Not completely, but it was enough. Enough to try and find out who they were. During this loop, you'd find them and put an end to this, you swore it.
}
{knowledge ? needHelp and searchForBird == 0 and tavern == 0: You'd been so foolish. So foolish to think you could take them out on your own. They were stronger than you'd anticipated. If you wanted to stand a chance, you couldn't do this alone. You needed to find help.}
{previous_death == "killed_with_char1": You can't get the sight of {char1} collapsed onto the ground lifeless out of your head. And it had been all your fault. If you were going to find help, you needed more that just his help.}
    + {wakeUp == 1} [Come on, get up.]
    -> introMonolouge
    + (GrabWeapon) {wakeUp > 2} [Grab your weapon first.]
    ~has_weapon = true
    {wakeUp == 3 or GrabWeapon == 1: 
    You didn't have your weapon on you, you would definitely need that before you left. Looking under the bed, you find it just lying there. You pick it up and sheath it at your waist before you head out for the day.
    - else:
    With a sigh, you reach under the bed and pick up your dagger, sheathing it at your waist. Same old motions, over and over.
    }
    -> HeadOut
    + {wakeUp > 1} [Head out for the day.]
    -> HeadOut
    = introMonolouge
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
        - else:
        {wakeUp > 2 and wakeUp < 10:
        You sigh. Not this again.
        + + + [Take a step back.]
        ~face_cut = false
        You take a step back before the innkeeper's dagger can graze your face.
        They yell at you for not paying them.
        You simply walk past them with a "Yeah, don't worry about it."
        They glare at you, but you just keep walking.
        Is this just going to happen every single time?
        + + + + [Head out to the center of town.]
                -> townCenter
        + + + [Run past.]
        ~face_cut = false
        This time, you take a chance and just run straight past them, and fling open the door, burting outside before they have the chance to hit you.
        Just as you shut the door to the inn, you feel a thud. They had actually just thrown the knife at the door.
        + + + + [Head out to the center of town.]
                -> townCenter
        + + + [Just let them hit you.]
        ~face_cut = true
        You don't even bother dodging it. You let the knife fly right past your face and graze you.
        That stinging pain serves as a reminder that you're still miraculously alive, and likely will be until you figure out what's going on.
        Before they have the chance to yell at you, you yell first.
        "I'll pay you back as soon as I can!"
        They hmph at you, "Next time I won't miss!"
        Oh but they would. They would miss every time.
        "Mhm," you reply and walk out the front door.
        + + + + [Head out to the center of town.]
                -> townCenter
        - else:
        Actually, you really just couldn't deal with that innkeeper anymore. Instead of heading downatairs, you simply choose to climb out of your room's window and land on the street below. With that, you head over to the center of town.
        -> townCenter
        }
        }
        }
        
    = townCenter
    You find yourself standing out in the center of town. You stretch out your limbs, still a bit stiff from sleeping on that rock hard bed. Looking around you see its as busy as usual, even this early in the morning. 
    {wakeUp > 2: 
    You spotted {char1} off in the distance. He was bound to run into you if you weren't paying attention, and you really didn't feel like getting run into anymore, even by {char1} as sweet as he was, so make sure to pay careful attention to not letting him run into you.{wakeUp == 3 or not (knowledge ? assassinAfterYou): Right now, you needed to focus on trying to get one of those jobs done. Yes they had gotten you killed twice before, but you weren't giving up just yet.}{knowledge ? assassinAfterYou and not (knowledge ? assassinAppearance): Right now, you needed to figure out what that assassin looked like, even if with just a glance. Unfortunately for you that means you'd have to get yourself killed by them again.}{knowledge ? assassinAppearance and not (knowledge ? needHelp): Your next step was try try and figure out who that assassin was and why they were after you. That means you'd have to try and find them before they found you. In a town full of assassins, surely that would be possible.}{knowledge ? needHelp: You'd tried to deal with that assassin on your own before, but you knew how badly that had gone. You think about it for a long time, but really, you were going to need some help. {char1} was probably your best bet.}
    -> townCenterOptions
    }
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
        + {wakeUp <= 2} [Head to the Guild Headquarters.]
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
        
        = char1Introduction
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
            
    = townCenterOptions
    {char1_in_party: "So, {protagNickname}, where are we going next?" {char1} asks. {char1bird} lets out a questioning caw from his shoulder.}
    {char2_in_party: {char2} stands a bit farther away, crossing her arms, "Its up to you {protag}."}
        + [Head to Headquarters.]
        -> headQuarters
        + {knowledge ? assassinAppearance} [Search the town for the Assassin.]
        -> assassinSearch
        + {knowledge ? needHelp and not char2_in_party} [Head to Tavern to search for help.]
        -> tavern
        + {knowledge ? needHelp and not char1_in_party} [{bird_found: Give {char1} his bird. | Ask {char1} for help.}]
        -> talkToChar1
        + {(talkToChar1 > 1 or looking_for_bird) and not bird_found} [Look for {char1}'s bird.]
        -> searchForBird
        + {not has_weapon} [Grab your dagger first.]
        You'd... left your dagger in your room again. Really?
        You sigh at your idiocy, and head back to the inn to get your dagger back.
        desperate to avoid the tormet of the innkeeper, you climb through a window to get back into your room and grab your dagger before returning back to the town center.
        ~has_weapon = true
        -> townCenterOptions
    
    = headQuarters
        You head inside the spacious office building. {wakeUp == 1: For as much money that the guild raked in, or at least you assumed, the interior of their headquarters certainly didn't reflect it. To be completely honest, the buldiding looked abandonded and completely trashed. You weren't entirely sure who managed any of the legislative stuff in the guild, it was all pretty secrative. You only really joined as a means for you to make money and find jobs easier. Well that, and, now that you'd joined it you couldn't exactly leave. They didn't treat desertion very lightly.}
        There are a few people inside, who all turn their heads in your direction when you enter. Not exactly welcoming either. {wakeUp <= 3: You smile at them nervously as you pass. {wakeUp == 3: You're really starting to get tired of the fake humility though.} | {wakeUp <= 5: You've stopped bothering to aknowledge them anymore. Whatever, let them have their way, you're too tired to deal with it anymore. | You stare back at a few of them, glaring. They really were annoying.}} On the back wall, there are a couple boards set up, used for job postings and also to list the current rankings.
        {char2_in_party: "What are we doing here? I thought we needed to deal with that assassin friend of yours {protag}," {char2} complains.<br><br>"I guess he just had something to do in here," {char1} says shrugging. <br><br>{char1bird} caws tiredly.}
        - (HQoptions)
        + {not char1_in_party} [Check the current job listings.]
        You walk up to one of the boards set up with all of the current job listings. There's the usual: assasinations of high ranking officials in nearby towns, bounties out for escaped and on-the-run convicts, and even a couple up for monsters lurking in nearby forests terrorizing townsfolk. {wakeUp > 2: It really is exactly the same every time, and you're only qualified for the same two options. You sigh.}
        {wakeUp == 1: 
        Unfortunately for you, a vast majority of these were definitely way too much for your skill set. You narrow down a couple that you might choose from- in other words, the ones you probably won't die try to do - all of which not really giving much reward money, but better than nothing.
        The first job listing in just a simple monster hunt. Theres a pack of beasts somewhere out in the woods that needs dealing with. Simple enough, and it doesn't look like anyone's taken this one yet. 
        The second one is a little bit trickier. This one involves hunting down a mercenary. It doesn't state what he did, just that there is a bounty out for his head. The reward money isn't all that much so you figure he probably isn't too big of a threat and you might be able to handle it. Plus the pay was slightly higher than the other one.
        - else:
        {wakeUp == 2:
        As you scan through the different jobs, trying to pick out ones that you might do, you realize that they are all the same as the ones from you dream. You close your eyes, breathing out. This definitely wasn't just coincidence anymore.
        And once again, the only options that seemed reasonable were the monster hunt - the same type of monster from that dream of course - and the bounty out on that mercenary - again, with the same description from the dream. Maybe you ought to stop referring to it as a dream. A vision more like it.
         {jobOne == 1: You shudder thinking back to that monster hunt job from that vision. {previous_death == "monsters": The way that those monsters tore right through you with ease. More nauseatingly, you think to how they probably ate your corpse afterwards, or tried to, and shudder at the thought. Yeah, no thank you.}{previous_death == "assassin": You can barely remember it, but you'd been stabbed, right through the chest, from behind. Who was that anyways? That was so random. Was it some kind of vision metaphor? Like it was telling you how dumb you were for not checking the location of the monster first?} Maybe that vision was a sign to take the other job, you'll probably have more luck with it anyways. {has_weapon: Although, now you did actually have your dagger this time. That might make the whole situation a bit easier to deal with.}}
         {jobTwo == 1: Thinking back on that vision, you remember how poorly the whole situation with the second job had went. {previous_death == "mercenary": You couldn't even handle the mercenary in that vision. Though to be fair, maybe you'd just said the wrong thing. You think back to what you'd said and grimace. That WAS pretty stupid.}{previous_death == "assassin" and HelpChildren: You'd risked helping out those kids. And though you had, you ended up getting stabbed in the back anyways! Which was really weird? Who even was that? Maybe it was some type of weird vision metaphor. Like trying to save people was some waste of time. But that seemed pretty messed up.}{previous_death == "assassin" and not HelpChildren: You'd managed to overpower that mercenary, even without a weapon, but were still stabbed in the back! Maybe it was whoever that man had talked to in that tavern, though something about his expression made it seem like he didn't recognize the person.}{has_weapon: Although, now you did have your dagger with you, which might solve some of your problems.}}
         - else:
         {not (knowledge ? job1Success) and not (knowledge ? job2Success): You still hand't been able to accomplish either of the two jobs available to you. Even after multiple attempts. You ought to try again, especially with what you now know.}
         {knowledge ? job1Success and not (knowledge ? job2Success): You'd already tried the monster hunting job, and had succeeeded, only to get stabbed in the back by that assassin. If you wanted to be sure that that assassin really WAS after you, you needed to try and get that other job done. Otherwise, you might just be missing an opportunity to get out of this horrid time loop.}{knowledge ? job2Success and not (knowledge ? job1Success): You'd already tried dealing with that mercenary, and had succeeeded, only to get stabbed in the back by that assassin. If you wanted to be sure that that assassin really WAS after you, you needed to try and get that other job done. Otherwise, you might just be missing an opportunity to get out of this horrid time loop.}{knowledge ? assassinAfterYou and not (knowledge ? assassinAppearance): Just one more time. One more timed you needed to run into that assassin. This time, you use the opportunity to try and see what they looked like. That did mean however, that whichever choice you made, you had to make sure that the assassin would find you before anything else killed you.}{knowledge ? assassinAppearance and not (knowledge ? needHelp): You knew what that assassin looked like, at least for the most part. You could still see those cold silver eyes and that long black hair. Going back out on a job wouldn't get you money you knew that, it would just get you killed. What you needed to focus on now, was finding that assassin before they had the chance to find you.}{knowledge ? needHelp: Why were you still here? Were you just itching to get killed again? What you really needed to do now, if you ever hoped to make it out of this time loop, was find someone who would help you fight off that assassin.}
        }
        }
            + + {knowledge ? assassinAfterYou} [Decide against it.]
            To be honest, you'd really rather not have to go out again, probably just to get killed by that assassin again. {not (knowledge ? assassinAppearance): But really, without knowing what they looked like at all, what other choice did you have?}{knowledge ? assassinAppearance: Besides, you had better things to do.}
            -> HQoptions
            + + [Take the first job. Go on a monster hunt.]
            {wakeUp == 1: -> jobOne}
            {wakeUp == 2 and jobOne == 1: 
            You know what, you wanted to try this job again. With the warning from that vision, you were sure to not mess it up again.{has_weapon: Especially with your weapon now in your possession. Those monsters{previous_death == "assassin":, or whoever that guy who stabbed you was,} wouldn't be much of an issue.}
            {not (knowledge ? monsterLocation): 
            ~knowledge += monsterLocation
            Oh, and you ought to check where the monsters actually where this time. There was no way you were going to go to the wrong place again and get stabbed in the chest again. You look a bit more carefully at the job request this time and see that the monsters are located at the lakeside forest. Whoops. 
            }
            Now, you could always reconsider. The vision did warn you about this job in particular. It would probably be safer to choose the other option.
                + + + [Go for it.]
                -> jobOne
                + + + [Actually, lets try the other job.]
                -> jobTwo
            - else:
            {jobOne >= 1 and not (knowledge ? monsterLocation): 
            ~knowledge += monsterLocation
            Oh, and you ought to check where the monsters actually where this time. You look a bit more carefully at the job request this time and see that the monsters are located at the lakeside forest. Whoops. 
            }
            {knowledge ? assassinAppearance: 
            You really were just itching to die again. To experience the pain of death all over again. You knew, deep down, it really didn't matter what you chose. With that assassin still after you, there wasn't anything you could do to succeed, but this is still waht you choose to do. To perpetuate the cycle.
            Unless of course, you choose otherwise. You choose to try and live. To find some other means to end all this.
                + + + [Try this job once more.]
                -> jobOne
                + + + [Try something else.]
                -> HQoptions
            }
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
            {knowledge ? assassinAppearance: 
            You really were just itching to die again. To experience the pain of death all over again. You knew, deep down, it really didn't matter what you chose. With that assassin still after you, there wasn't anything you could do to succeed, but this is still waht you choose to do. To perpetuate the cycle.
            Unless of course, you choose otherwise. You choose to try and live. To find some other means to end all this.
                + + + [Try the job once more.]
                -> jobTwo
                + + + [Try something else.]
                -> HQoptions
            }
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
            At least there were still like 160 people ranked lower than you. Better than nothing you suppose.
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
            + + (Char2Rank) {checking_char2_ranking} [Check {char2}'s ranking.]
            {Char2Rank == 1: 
            You scan the board looking for {char2}'s name. You find it almost immediately. Oh... OH.
            She was ranked 8th on the board. 
            You stand there shocked for a moment. That meant she was in the top 10 of all assassins in the guild. Out of a THOUSAND trained assassin's. And she was ranked 8th? {YourRank: You think back to where you're ranked on the board, extra embarrased. {Char1Rank: Both {char1} and now {char2} were ranked so much higher than you.}}
            In this case, you really did hope that she'd be willing to help you out. If she was ranked this high, you would'nt have to worry about that assassin at all. Even you were able to last for a few seconds against them, so just imagining how {char2} would fare, you really weren't all that worried.
            Still though, you would need to actually convince her to help you out first.
            - else:
            You look at {char2}'s name on the board. All the way up at 8th place. You really can hardly believe it.
            }
            -> CheckRankings
            + + [Go somewhere else.]
            -> HQoptions
        + {wakeUp > 2} [Head back out to town.]
        You decide to head back out into town and do something else.
        -> townCenterOptions
    
    
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
                    You've done this before. You knew the monsters's wouldn't come, but, you knew that THEY would. So, rather than waiting for monsters, you waited for that assailent to show up here at this location to kill you, again.
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
    
    = wolfEncounter
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
                        
                        
    = monsterEncounter
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
                    
    = stuckInMud
        + [Try to get out.]
            {stuckInMud < 5: 
            You twist and turn trying to get your leg unstuck, water sloshing all around you, but it doesnt budge.
            - else:
            This really isn't going to work.
            }
            -> stuckInMud
        + (Yell1) [Yell for help.]
        With not much of an option, you start to yell for help. There probably wasn't anyone nearby, but what other choice did you have? 
        You yell and yell and yell, but no one comes. Its just you and the bugs.
        + + [Continue]
        -> job1Failure
    
    = job1Failure
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
    {jobOneSuccess == 1 and not (knowledge ? assassinAfterYou):
    That is, until you feel a sharp pain in your chest.
    {killed_by_assassin > 1: There was no way. Not again.}
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
    {knowledge ? assassinAfterYou and not (knowledge ? assassinAppearance):
    At least this time around, you hoped you might get a look at their face. That was your only hope in trying to find them before they found you the next time you woke up.
    }
    And then, the smallest sound, the noise of metal sliding from its sheath directly behind you.
    You wirl around{has_weapon:, dagger in hand, even though you knew it was pointless}.
    You dodge quickly to the side, the stab from the assailent's sword narrowly missing your heart, instead embedding itself into your shoulder, sending pain all throughout your arm.
    Their next blow wouldn't miss, even if you knew where it came from, you simply weren't fast enough.
    They strike again before you can even react, sending their blade straight throught your heart once more.
    You cough up blood, it spilling down your front onto the ground below.
    {knowledge ? assassinAfterYou and not (knowledge ? assassinAppearance):
    As you vision fades, you take what little time you have to note their appearance before you wake up once more. they were covered from head to toe in a black cloak, a hood over their head and the lower half of their face covered. What you could see though, hidden in that darkness, where a pair of silver eyes filled with malice, and a few strands of black hair.
    When you wake, you pray you might stand a chance of finding them before they get to you. To end this horrid loop.
    ~knowledge += assassinAppearance
    }
    Your vision fades to black.
    }
    }
    + [Wake up.]
        -> wakeUp
        
    = jobOneSuccess
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
            {HelpChildren > 0: Though from past experience, you remember having gotten stabbed in the back just after saving them. But, maybe it was worth it. {HelpChildren == 1 and not (knowledge ? (job1Success, job2Success)): Besides, this time, at least you knew, and surely would be more prepared.}}
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
                        {HelpChildren > 1: You had almost forgotten.}
                            -> job2Failure
                        }
                        + + + (Fists1) [Go in bare-handed.]
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
                                    
            = job2Failure
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
            {jobTwoSuccess == 1 and not (knowledge ? assassinAfterYou):
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
            {knowledge ? assassinAfterYou and not (knowledge ? assassinAppearance):
            At least this time around, you hoped you might get a look at their face. That was your only hope in trying to find them before they found you the next time you woke up.
            }
            And then, the smallest sound, the noise of metal sliding from its sheath directly behind you.
            You wirl around{has_weapon:, dagger in hand, even though you knew it was pointless}.
            You dodge quickly to the side, the stab from the assailent's sword narrowly missing your heart, instead embedding itself into your shoulder, sending pain all throughout your arm.
            Their next blow wouldn't miss, even if you knew where it came from, you simply weren't fast enough.
            They strike again before you can even react, sending their blade straight throught your heart once more.
            You cough up blood, it spilling down your front onto the ground below.
            {knowledge ? assassinAfterYou and not (knowledge ? assassinAppearance):
            As you vision fades, you take what little time you have to note their appearance before you wake up once more. they were covered from head to toe in a black cloak, a hood over their head and the lower half of their face covered. What you could see though, hidden in that darkness, where a pair of silver eyes filled with malice, and a few strands of black hair.
            When you wake, you pray you might stand a chance of finding them before they get to you. To end this horrid loop.
            ~knowledge += assassinAppearance
            }
                Your vision fades to black.
            }
            }
                + [Wake up.]
                -> wakeUp
                
            = jobTwoSuccess
            ~knowledge += job2Success
            -> job2Failure
                
    
    = assassinSearch
    {knowledge ? needHelp and not char1_in_party and char2_in_party:
    Wait, did you really want to try and take on the assassin who's after you without getting any help first? You've tried to do this on your own before and failed. Do you really think you can handle it all by yourself?
        + [Go back and look for help.]
        -> townCenterOptions
        + [Go on by yourself.]
        -> failure
    }
    {not char1_in_party and not char2_in_party: -> failure}
    {char1_in_party and not char2_in_party: -> duelFailure}
    {char1_in_party and char2_in_party: -> ending}
    
    = failure
    ~killed_by_assassin += 1
    {failure == 1:
    Now knowing a bit about what the assassin actually looks like, you attempt to search around the town to find them. Or at the very least, discover someone fitting that discription who might be following you. You weren't sure if they had been following you from the very start, or as soon as you had stepped out to take on a job, but you were going to find out.
    You walk around town for a while, simply looking for anyone who might have those silver eyes and black hair, but to no avail.
    + [Continue]
    That is, until, out of the corner of your eye, you notice someone looking in your direction. You try not to make it obvious that you noticed them. 
    They were completely covered in black clothing from head to toe, just like that assassin who'd killed you so many times in previous loops. Granted, this was a town full of assassins, so this type of attire wasn't exactly uncommon, but they were the only person who's attention appeared to be fixed on you. And, trying to take a closer look under that hood, even obscured by shadow, their silver eyes weren't difficult to make out. A shiver runs down your spine, that must be them.
    There was a street on the other side of town that was usually pretty vacant. A street where the assassin might take a chance to strike. You hoped they wouldn't realize your plan as you start walking in that direction.
    As you start walking however, and check back to see if they were still following you, they were no longer standing where they once were. Freaky.
    You contininue to head in that direction until eventually, you get to a part of town thats mostly abandoned.
    Your heart starts pounding, looking for any sign of that person.
         + + [Continue]
         You hear that sound again. The slide of metal against metal, like a weapon being unsheathed.
         You turn quickly around{has_weapon:, pulling out your dagger to block their strike. Metal clashes against metal, the sound ringing throughout the empty street.| dodging quickly out of the way, narrowly avoiding that deadly sword. Without a weapon, this might be difficult.}
         "What do you want from me? Why are you trying to kill me?" you shout. You really couldn't fathom why.
         They don't respond, their cold silver eyes still boring into you from under their hood.
         They swipe at you with their weapon again. And again and again.{has_weapon: You block some of these, but most of them land, cutting deep into your skin.|You try to dodge some of these, but so many of them land.}
         They were fast, way too fast. You knew this, and yet.
         Bloodied and panting, you try to ask them again.
         But they don't respond. They just land that last final blow, burrying their sword deep into your gut.
         Pain blooms all around the wound and you collapse to the floor, as your life slowly drains out of you once more.
         They stand above you, as they always would. You couldn't do this on your own, no matter how hard you tried.
         ~knowledge += needHelp
         ~previous_death = "assassin"
         Your vision fades to black.
            + + + [Wake up.]
                -> wakeUp
        - else:
        You head straight for a more disterted section of town. You knew that the assassin had been following you, right from the begining and that they would take this opportunity to get rid of you. You just wanted to try again, to test your limits and see if you standed any semblance of a chance against them.
        You walk until the crowds thin out, and its just you standing in the middle of the wide street. Well. Just you and the assassin that's after you on this endlessly repeating day.
            + [Continue]
            "Come out and just try to kill me!" you shout out onto the empty road.
            For a moment, you thought that might distract them, to stall their attack, but when you turn around, you find them standing opposite of you. Well, at least this time they didn't just try to kill you outright. This time.
            {has_weapon: You pull out your dagger, ready to fight back even if a part of you knew you would loose anyways, just like before.|You raise your fists (why hadn't you made sure to grab your dagger first?), ready to fight back}
            But they're on you in an instant, their silver eyes boring into yours. You stumble bakwards a bit, and they take the chance to strike out with their sword.
            {has_weapon: But you block it just in time, the sound of your weapons clahsing resounding off the buldings lining teh street.|But you dodge out of the way just barely.}
            At this point, you were starting to get familiar with their movements, but even so, they were far more skilled than you.
                + + [Continue]
                You try to block or dodge each of the slashes and stabs of your sword, but it gets to a point, as is always does, where you just can't keep up.
                 They land that last final blow, burrying their sword deep into your gut.
                 You clutch at the weapon, gasping in pain, and look at them once more. Still all you can make out are those eyes and that hint of black hair under their hood. You reach out with a trembling hand to try and remove their hood, but they back away, pulling their sword out with them.
                 They leave you to collapse on the side of teh road, their mission having been complete.
                 If you hoped to stand a chance, you would need a much more skilled assassin than yourself to help you out. 
                 Lying there, on the ground, you wait as your vision slowly fades to black.
                 Back into the cycle once more.
                 ~previous_death = "assassin"
                    + + + [Wake up.]
                        -> wakeUp
        }
    
    = duelFailure
    {duelFailure == 1:
    This time, you actually had some help. {char1} walks next to you, {char1bird} now perched on his shoulder.
    "So uh, where's this assassin that you're saying is after you?" he asks.
    You shush him, glancing all around. You knew they were following you, why were they so hard to spot.
    But finally, you find them, leaning against a nearby building.
    "Over there," you whisper to {char1}.
    "Where?" he asks, not even bothering to quiet his voice.
    You grimace. Maybe he wasn't the best choice to help you out here. {TalkToChar2 >= 1: Maybe you should've tried talking to {char2} again. At least she seemed level headed. {KilledByChar2 >= 1: Then again, she didn't seem to like you all that much...}}
    "Oh, do you mean that guy?" he says, pointing in the direction of the assassin.
    Oh, well then. there goes any subtlety.
    When the assassin spots the two of you, having been found, they start walking in the opposite direction.
    Before you can stop him, {char1} starts running after him, shouting, {char1bird} squawking along with him.
    "Wait! Wait don't be stupid!" you shout trying to pull him back, but he keeps storming off.
    You slap your forehead. Great.
        + [Continue]
        {char1} is already out of sight, but you keep running in the direction he went, following after that assassin. But when you turn a corner, what you see is the assassin, standing there, swatting away {char1bird} as she flaps around their head trying to peck at them. 
        But, lying just below that was {char1} on the ground, clutching at his bleeding abdomen with his broadsword having fallen onto the ground next to him. Looking back at the assassin, you see them, their sword drawn, it soaked in blood.
        You stand there, shocked. Even {char1}. They even took out {char1} with no problem.
        {char1} just lies thre groaning in pain, trying desperatly to stand back up.
        You rush to his side, letting him lean on you.
        He looks over at you, "Dude, you didn't warn me how strong this guy was." He laughs, coughing up blood, before collasping motionless in your arms.
        You're too shocked to move.
            + + [Continue]
            And you're too shocked to react when the assassin finally tuns their attention back to you and deals that final blow once more.
            You lie on the ground, right next to {char1}, who was already gone.
            Your vision fades to black.
            ~killed_by_assassin += 1 
            ~previous_death = "killed_with_char1"
                + + + [Wake up.]
                -> wakeUp
    - else:
    // you make sure to tell him NOT to chase after them, yall still die though RIP
    With {char1} in tow, {char1bird} now perched on his shoulder, you decide to try and draw out the assassin. You remember the last time you tried to deal with the assassin with {char1}'s help, and {char1} had simply gotten himself killed, so this time, you tried to avoid that result. {TalkToChar2 >= 1: Maybe you should've tried talking to {char2} again and getting her help as well to give you and {char1} a better chance against this assassin. {KilledByChar2 >= 1: Then again, she didn't seem to like you all that much...}}
    You grab {char1}'s arm and start dragging him to that empty street where the assassin had gotten you the first time.
    "Hey, {protag}, where are we goin? I though we were gunna look for that assassin?"
    "We're going to get them to come to us," you reply with a sigh, still dragging him along.
    "Oh! Yeah that sounds like a smart idea!"
    Sure it sounded like a smart idea{duelFailure > 2:, but the last time this happened, you still ended up dead. You wondered if it would be any different at all this time.|, but knowing how it went the last time, you did have some doubts.}
        + [Continue]
        The two of you arrive at the empty street. {char1} looks around, "Soooo, what are we doing over here, there's nothing around." {char1bird} croaks in agreement.
        "They'll be here. Stay on guard."
        "Alllllllright."
        You both stand there for a while. You look around, waiting. Usually, the assassin would have shown themselves by now. {duelFailure == 2: What was holding them? Were they actually worried about facing off against both of you?}
        But, just then, {char1} yells, "Look out!", pushing you out of the way. You tumble onto the ground. {duelFailure > 2: He still had better reflexes then you did, even after you'd seen how this goes already.}
        Looking back up, you see the assassin and {char1} locking swords. {char1bird} flies around, cawing and trying to peck at the assassin as well. They exchange a few blows, and {char1} somehow manages to keep up, though it was clear he was at a disadvantage. Could he deal with this own his own? {not has_weapon: But you couldn't really do anything without your dagger could you.}
            + + (HelpChar1)  {has_weapon} [Step in to help {char1}.]
                {HelpChar1 > 1: Even knowing how it would end, you couldn't stand back.} You climb back up onto your feet, and pull out your dagger. While the assassin is busy fending off {char1} you might get the chance to strike. 
                But, as you do, you notice that {char1} is getting overpowered. This next blow was going to land and he wouldn't be fast enough to dodge it. Without thinking, you move in between them, you dagger poised to block the attack.
                But, just like {char1} you weren't fast enough either, and the assassin's blade stabs through you.
                You collapse onto the ground, but at least this time, {char1} hadn't gotten hurt.
                With you dealt with, the assassin doesn't even bother fighting {char1}, they simply dissaper within seconds. 
                "{protag}!"
                {char1} runs over to you, letting you lean on him as you bleed out.
                "Hey dude, hang on! You'll be okay! Just hang in there!"
                But you wouldn't be, you knew that.
                Your vision fades to black once more.
                ~killed_by_assassin += 1
                ~previous_death = "assassin"
                    + + + [Wake up.]
                    -> wakeUp
            + + (LetChar1HandleIt)[Let {char1} deal with it.]
            {LetChar1HandleIt > 1: You knew that he wouldn't win, but what else were you supposed to do? Its not like you stood a chance against the assassin either.}
            You stay there, on the ground, as you watch the two of them fight.
            Within moments, {char1} is overpowered, and the assasssin stabs him through the middle.
            As {char1} collapses, he looks over to you still frozen on the ground.
            "I'm sorry I.. I couldn't help you." he manages to choke out.
            The assassin turns their attention over to you now, and you've no choice but to stand there, helplessly, as they approach you, their sword already stained with {char1}'s blood.
            You shut your eyes, tightly, as they strike you down once more.
            You feel pain in your chest, an all too familiar feeling at this point, and then slowly that pain fades.
            ~killed_by_assassin += 1
            ~previous_death = "killed_with_char1"
                + + + [Wake up.]
                -> wakeUp
    }
    
    
    = tavern
    {tavern == 1: You head into the tavern, hoping to look for someone who wouldn't mind helping you out of this situtaion. It was the very same one you had been in the previous night - or, really more like the last {wakeUp} nights, but who was counting really. Regardless, you'd found yourself in this place many times before, which is probably not a good thing, since you've been stuck trying to make back all of that money you had spent for a while now. For a moment you wonder if whatever reason that assassin was after you was tied to this place in some way. But you quickly shurg off that speculation. Really, what could have happened in just one night that would lead someone to try and kill you. Assassin's were pretty spiteful, you second guessed yourself, but still.}
    Inside the tavern, it isn't all too busy at this time of day. There were a few groups of people sitting at tables socializing, probably talking about all the cool new ways they found to dispatch monsters. Some where playing card games or gambling. There was one person in the back passed out drunk, probably still there from the previous night, though it wasn't like you remembered.
    {not char2_in_party:
    Out of the people here, you recognized a few of them, but not really anyone who you were aquainted with. Well besides one.
    {char1_in_party: 
    "Oh hey! Its {char2}! We should go talk to her." {char1} comments excitedly, waving at someone sitting at a table. {char1bird} caws happily as well.
    You glance over to where {char1} is looking.
    }
    At one of the tables you see {char2} sitting alone, sharpening a knife, with a large mug next to her. She seemed to be pretty absorbed in what she was doing so she doesn't even look up when you come in. {char1_in_party:Though she DOES notice {char1}, who of course is pretty hard to miss, but when she does see him she gives him a small wave and something that almost resembles a smile. Really? Why did he get that treatment?} 
    {tavern == 1: {char2} was also someone you had worked with in the past, though, it was more like you just happened to be around when she was going out on a job with {char1}. You'd talked to her a few times in the past but she didn't really talk much. Or at least, she didn't talk to YOU much.} You could always try asking her for help.
    There wasn't really anyone else in the room you had ever really talked too, the Assassin's Guild was a pretty big organization after all, so you supposed that {char2} was your only real option. Then again, you wern't all too confident that she'd be willing to help you.
    }
    - (top)
    + (TalkToChar2) {not char2_in_party} [Talk to {char2}.]
    {not char2_rejected:
    You decide to try talking to {char2}. When you approach the table, she looks up from sharpening her knife, {char1_in_party: giving {char1} a nod of aknowledgement, but completely glancing over you|merely giving you a glance} before returning her gaze back to the task at hand.
    Well she didn't yell at you to leave, so you sit down at the table across from her. {char1_in_party: {char1} sits pulls up a chair next to you and sits as well, leaning an arm on the back of your chair. {char1bird} flaps over and lands on the table next to {char2}, who scratches her feathers.}
    {char2} sets her knife down on the table, taking a sip from the mug next to her. {char1_in_party: "So, what do the two of you need from me?" she says, her tone uninterested.|"What to you want?" she asks curtly, looking over at you with a cold expression.}
    {char1_in_party: You let {char1} speak for you.<br><br>"Well you see, ol' {protagNickname} here has been having a bit of an issue with another guild member that we were hoping you could help us out with," he says.|"Uh, well, I've kinda been having this issue with another guild member that I, um, was hoping you might be able to help me with," you manage to say.}
    {char1_in_party: "What issue would that be?" she asks, still petting {char1bird}. |She replies, "And? Why should I care?"}
    {char1_in_party: You explain the situation to her, about the assassin that's been after you, and she nods, half paying attention. | You laugh nervously, rubbing the back of your head, before you explain the situation to her, about the assassin that's after you. At some point during your explaination, she picks up her knife and starts sharpening it once more. You weren't sure if she was actually paying attention.}
    {char1_in_party: "I see."<br><br>"Awesome! Will you help us out then?" {char1} asks.<br><br>"I will, however-," she says, truning her attention to you, "I'm going to need {protag} to answer a few questions for me. We'll have a little game. And, {char1}?"<br><br>"What's up?" he asks.<br><br>"Don't help them, I want them to answer the questions on their own."|"Well uh, do you think maybe you could help me out?" you ask.<br><br>She finally turns her attention to you, "I'll consider it."<br><br>"Great-"<br><br>"However, only if you're able to answer a few questions for me. We'll make it into a little game."}
    You feel a sense of dread come over you, it just couldn't be easy could it?
        + + [Continue]
        ->Question1
    - else:
    You walk over to {char2} to try and speak with her again, but she shooes you away.
    "I already told you that I'm not going to bother helping you," she says with a glare.
    {char1_in_party: {char1} pouts, "But {char2}, are you sure? We really want your help..."<br><br>The look on her face is almost one of regret before she quickly composes herself, and says with a small cough, "I, uh, I already told you, I'm not going to help out someone as helpless as {protag} who can't even answer a few simple questions."<br><br>That was so uneccessary.}
    You walk away dejected. {char1_in_party: {char1} and {char1bird} follow you with their heads held low.}
    -> top
    }
    + [Head out.]
    -> townCenterOptions
    
    = Question1
    "First question then," {char2} starts. "How many members of the Assassin's Guild are there?"
        {TalkToChar2 == 1: Wait was she seriously just quizzing you right now?}
        {char1_in_party: {char1} opens his mouth to try and answer the question, but {char2} looks at him with a glare and he shuts his mouth.}
        {YourRank >= 1: You remember looking at the Ranking Board in HQ in one of these time loops. When you did, you were ranked at 839th place, with just around like 160 people below you, so there must be about like a thousand total members of the guild.}
            + (CorrectAnswer1) {YourRank >= 1} [Just about a thousand.]
            ~questions_right += 1
            "A thousand," you reply confidently{CorrectAnswer1 > 1:, "well 1,004 to be more precise."|.}
            {CorrectAnswer1 > 1:{char2} looks at you, slightly suprised, "Exactly right." |{char2} looks over at you, squinting her eyes. "It's actually 1,004 but I'll give it to you."}
            You let out a sigh of relief.
            {char1_in_party: {char1} pats you on the shoulder. "Nice work dude!{CorrectAnswer1 > 1: You even got it exactly!}"}
            -> Question2
            + [A couple hundered.]
            You laugh sheepishly, and answer, "A couple hundred?"
            She looks at you pointedly, "Seriously?"
            "Aha, I guess not then."
            {char1_in_party: {char1} pats you on the shoulder. "You'll get the next one for sure!" {char1bird} nods in agreement from across the table. At least someone was on your side.}
            {not YourRank: You might want to check the ranking board over at HQ to confirm the right number.}
            -> Question2
            + [A couple thousand.]
            You laugh sheepishly, and answer, "A couple thousand?"
            She looks at you pointedly, "Seriously?"
            "Aha, I guess not then."
            {char1_in_party: {char1} pats you on the shoulder. "You'll get the next one for sure!" {char1bird} nods in agreement from across the table. At least someone was on your side.}
            {not YourRank: You might want to check the ranking board over at HQ to confirm the right number.}
            -> Question2
            + [Like 50.]
            You laugh sheepishly, and answer, "Like 50?"
            She looks at you pointedly, "You're joking right?"
            "Aha, I guess not then."
            {char1_in_party: {char1} pats you on the shoulder. "You'll get the next one for sure!" {char1bird} nods in agreement from across the table. At least someone was on your side.}
            {not YourRank: You might want to check the ranking board over at HQ to confirm the right number.}
            -> Question2
            
    = Question2
    "Onto the next question," she continues. "What weapon does {char1} most often use in combat?"
    {char1_in_party: "Oh, oh, I know this one!" {char1} says excitedly.}
    {duelFailure or CorrectAnswer2: You remember that {char1} typically uses a broadsword to fight. {duelFailure: You grimace remembering the last time you'd seen him use it. Though hopefully you might convince {char2} to help you and that wouldn't happen again.}}
        + [A battleaxe.]
        "A battleaxe," you answer.
        {char2} shakes her head. "No its not. Aren't you two friends?"
        "Uh, well, yeah. Guess I forgot."
        {char1_in_party: "No, its okay dude. Its not like I remember was kind of weapon you use," {char1} says laughing heartily.<br><br>Of course he wouldn't remember, though you were one to talk.}
        -> Question3
        + (CorrectAnswer2) [A broadsword.]
        ~questions_right += 1
        "He uses a broadsword, right?"
        {char2} gives you a small nod of approval, "That's right."
        {char1_in_party: "Aw {protagNickname}, you actually remembered?" {char1} says with a look of appreciation on his face. <br><br> You look away, a bit embarrassed, "Well, yeah, of course!"}
        -> Question3
        + [His fists.]
        "Trick question, he uses his fists, not any weapon," you answer.
        {char2} shakes her head. "What? No. Aren't you two friends?"
        "Uh, well, yeah. Guess I forgot."
        {char1_in_party: "No, its okay dude. Its not like I remember was kind of weapon you use," {char1} says laughing heartily.<br><br>Of course he wouldn't remember, though you were one to talk.}
        -> Question3
    
    = Question3
    "Next question," {char2} continues. "What's my ranking in the guild?"
    ~checking_char2_ranking = true
    {not Char2Rank: You sit there, staring. You actually had no clue. You'd have to go check the ranking board sometime when you had the chance. For now though, you'd have to take a guess.|Luckily, you'd checked the board and now knew that she was ranked 8th.}
        + [Guess high in the rankings.]
        You decide to guess high in the rankings, though you aren't exactly sure where, so you just try rank 50.
        She looks at you pointedly and says, her voice low, "You really think I'm that low in the rankings?"
        What? Was that not a high rank to be at???
        {char1_in_party: {char1bird} shakes her feathery head at you. {char1} looks over at you, suprised, "Really dude? Don't you know how crazy strong our {char2} here is?"<br><br>When {char2} hears him say "our", it almost looks like she blushes a bit before returning to her usual steely expression.<br><br>You really weren't sure what you said wrong.}
        "Whatever, next question," she says, sounding a bit irritated.
        -> FinalQuestion
        + [Guess in the middle.]
        "Um, what about like, rank 400?"
        {char2} remains silent, her expression dark. Slowly, she sarts reaching for the knife she left on the table.
        {char1_in_party:
        {char1} quickly leaps up in his chair, reaching over the table to cover her hands. "Woah woah woah, just hang on {char2}, lets not get too hasty! {protagNickname} doesn't always think before he speaks!"
        She looks up at you, fury burning in her eyes. You start to scoot backwards in your chair.
        But luckily after a few moments she sits back down in her chair and composes herself.
        "Thats fine, we all make mistakes sometimes," she says putting on a fake smile.
        You laugh nervously. She {not KilledByChar2: probably} would have killed you if {char1} weren't here.
        -> FinalQuestion
        - else:
        -> KilledByChar2
        }
        + [Guess lower in the rankings.]
        "Um, what about like, rank 700 or so?"
        {char2} remains silent, her expression dark. Slowly, she sarts reaching for the knife she left on the table, her fingers twitching.
        {char1_in_party:
        {char1} leaps up in his chair, shouting "{char2} wait!" {char1bird} caws fearfully, flapping her wings. 
        He tries to lean over the table to stop her, but he wasn't quite fast enough.
        -> KilledByChar2
        - else:
        -> KilledByChar2
        }
        + (CorrectAnswer3) {Char2Rank} ["You're ranked 8th."] 
        ~questions_right += 1
        You lean back in your chair, smiling, "You're ranked 8th."
        She looks at you impressed, crossing her arms proudly. "That's right."
        But all of the sudden, her face is inches from yours, her knife pointed at your neck. Your eyes widen, you hadn't even seen her move. "And don't you ever forget that," she says quietly before leaning back in her chair.
        {char1_in_party: {char1} laughs, "Isn't she just the coolest." <br><br> Still shaking a bit you reply in a strangles voice, "Mhm."}
        -> FinalQuestion
    
    = FinalQuestion
    "Last question. What's my favorite color?"
    {FinalQuestion == 1: ...Wait, what? That's the question she wanted to ask you?"}
    {char1_in_party: "Oh, I actually don't know this one," {char1} says a bit disapointed.}
    {knowledge ? color: Luckily, you already knew that her favorite color was green. {not CorrectAnswer4: Thank's to {char1} of course.}}
        + [Blue]
        "Is it blue?"
        {char2} gives you a simple, "No."
        {char1_in_party: 
        "Can I ask you what your favorite color is?" {char1} asks gently. He sounded genuinely curious. <br><br> She looks over at him a bit suprised, and answers quietly, "Ah, its green actually."<br><br>"That's so awesome! That's my favorite color too!"<br><br>"Oh, is it?" she says turning away a bit. You swear she was blushing. Wow these two really were something else.
        ~knowledge += color
        - else:
        "Well what is it then?" you ask.
        She glares at you, "Like I'd tell you."
        Well okay then.
        }
        -> QuizResults
        + [Red]
        "Is it red?"
        {char2} gives you a simple, "No."
        {char1_in_party: 
        "Can I ask you what your favorite color is?" {char1} asks gently. He sounded genuinely curious. <br><br> She looks over at him a bit suprised, and answers quietly, "Ah, its green actually."<br><br>"That's so awesome! That's my favorite color too!"<br><br>"Oh, is it?" she says turning away a bit. You swear she was blushing. Wow these two really were something else.
        ~knowledge += color
        - else:
        "Well what is it then?" you ask.
        She glares at you, "Like I'd tell you."
        Well okay then.
        }
        -> QuizResults
        + (CorrectAnswer4) [Green]
        ~questions_right += 1
        ~knowledge += color
        "Its green, right?"
        {char2} gives you a simple, "Yes, it is."
        {char1_in_party: "That's so awesome! That's my favorite color too!" {char1} says excitedly.<br><br>"Oh, is it really?" {char2} says turning away a bit. You swear she was blushing. Wow, these two really were something else.}
        -> QuizResults
        + [Silver]
        "Is it silver?"
        {char2} gives you a simple, "No."
        {char1_in_party: 
        "Can I ask you what your favorite color is?" {char1} asks gently. He sounded genuinely curious. <br><br> She looks over at him a bit suprised, and answers quietly, "Ah, its green actually."<br><br>"That's so awesome! That's my favorite color too!"<br><br>"Oh, is it really?" she says turning away a bit. You swear she was blushing. Wow these two really were something else.
        ~knowledge += color
        - else:
        "Well what is it then?" you ask.
        She glares at you, "Like I'd tell you."
        Well okay then.
        }
        -> QuizResults
        + [Black]
        "Is it black"
        {char2} gives you a simple, "No."
        {char1_in_party: 
        "Can I ask you what your favorite color is?" {char1} asks gently. He sounded genuinely curious. <br><br> She looks over at him a bit suprised, and answers quietly, "Ah, its green actually."<br><br>"That's so awesome! That's my favorite color too!"<br><br>"Oh, is it?" she says turning away a bit. You swear she was blushing. Wow these two really were something else.
        ~knowledge += color
        - else:
        "Well what is it then?" you ask.
        She glares at you, "Like I'd tell you."
        Well okay then.
        }
        -> QuizResults
    
    = QuizResults
    {questions_right >= 4:
    "Well, it looks like you got all of my questions correct," {char2} says.
    "Does that mean you'll help me out then?" you ask.
    {char1_in_party:
    ~char2_in_party = true
    "Yeah, sure."
    {char1} beams, picking you up out of your chair and hugging you, "Heck yeah! Let's go team! We're off on an mission."
    {char2} chuckles quietly to herself.
    The three of you stand up, ready to leave.
    - else:
    ~char2_rejected = true
    "Eh, don't really feel like it."
    She made you do this quiz, only for her to completely reject you even though you got all of the questions right?
    "Are you serious?" you shout, standing up in your chair.
    She looks over at you glowering. "Yes, and I'm not going to repeat myself."
    You stand up in your chair, ready to leave. Well that wasn't sucessful. Maybe you ought to get {char1} to help you instead. Though maybe, if you had him here with you she wouldn't have rejected you.
    }
    -> top
    - else:
    ~char2_rejected = true
    "Well you missed a couple of questions, so I can't help you," {char2} says.
    Seriously?
    {char1_in_party: "Wait really {char2}? You can't help us at all?" {char1} says sadly.<br><br>She looks down, closing her eyes, "Sorry, I just can't help someone who can't even answer a few simple questions correctly."<br><br>You sigh, "Come on, {char1} lets just go," you say. The two of you stand up, ready to leave. If you wanted her help, you were going to have to answer her questions correctly.|"You won't reconsider?" you ask. <br><br>"No, now leave me alone."<br><br>Well alright then, if you wanted her help, you were going to have to answer all of her questions correctly. You stand up, ready to leave.}
    -> top
    }
    
    = KilledByChar2
    ~previous_death = "char2"
    Before you knew it, you were lying on the tavern floor, unable to feel anything at all and unable to move.
    You lie there, staring at the floor, as your vision starts to fade.
    {char1_in_party: You here the faint sounds of {char1} shouting at {char2}, before you fall into darkness completely.}
    + [Wake up.]
    -> wakeUp
    
    = talkToChar1
    {not bird_found:
    {not looking_for_bird:
    {talkToChar1 == 1: It isn't hard for you to find {char1} wandering around the town. One of course, being because he's the tallest person around, and also that his voice as he yelled out {char1bird}'s name could be heared from just about anywhere.}
    You walk up to {char1}, "Hey {char1}!"
    He turns towards you, beaming, "Oh hey {protag}! What's up?"
    "Do you think you could help me out with something?"
    "Oh uh sure dude! But I'm a bit busy right now, so maybe afterwards?"
    Oh that's right, he was looking for {char1bird},{knowledge ? bird: his bird| whoever that was}.
    "You're looking for {char1bird} right?"
    "I am actually! How did you know that?"
    Probably because you've been yelling it all morning, you think to yourself.
    "Lucky guess, anyways, do you need help looking?"
    He smiles at you again, he really never stopped smiling did he?
    "That would be super awesome! You remember what she looks like right?"
        + {knowledge ? bird} "Sure do."
            "Awesome! Well, lets split up and find her then! See you later dude!"
            He runs off.
            Well, looks like you had to go find that bird.
            ~looking_for_bird = true
            -> townCenterOptions
        + "Could you remind me actually?"
            "Oh for sure! She's pretty small, and she's got lots of black feathers, and a real sharp beak!"
            {not (knowledge ? bird): 
            Wait... was {char1bird} a bird the whole time? 
            ~knowledge += birdLocation
            }
            "Got it," you respond.
            "Awesome! Well, lets split up and find her then! See you later dude!"
            He runs off.
            Well, looks like you had to go find that bird.
            ~looking_for_bird = true
            -> townCenterOptions
    - else:
    "Oh, hey {protagNickname}! I haven't found {char1bird} yet. Have any luck on your end?"
    "Ah no, not yet!"
    "Ah that's alright! I'll keep looking then. I can help you out afterwards!"
    He scampers off to continue looking.
    If you wanted to get his help, you were going to have to help find his bird first.
    -> townCenterOptions
    }
    - else:
    {looking_for_bird:
    "Hey {char1}! I found {char1bird}!"
    He turns around beaming and {char1bird} squawks, flapping over to him cheerfully. She lands, perched on his shoulder, and he scratches her feathers.
    "Thanks so much {protagNickname}! You're the best!"
    You scratch the back of your head, embarassed.
    He continues, "So what do you need help with?"
    - else:
    "Hey {char1}! I found {char1bird}!"
    She squawks and flaps over to him. He turns around, suprised, and then beams when he sees her.
    "Hey thanks {protagNickname}! How did you know she was missing?"
    "Ah just a lucky guess. I was hoping you'd help me with something."
    "Sure thing. What do you need?"
    }
    You explain the situation, leaving out the part where you've been stuck in a loop of the same day like {wakeUp} different times.
    "I think there's an assassin after me."
    {char1}'s expression changes almost instantly, becoming serious. He closes his eyes pondering.
    He nods, "Yeah that seems like a problem." {char1bird} nods too.
    "Right, so do you think you could help me out? its not really something I can deal with on my own..."
    He claps you on the back, "Of course dude. Whoever this assassin guy is, we'll deal with it together."
    You let out a sigh of relief. Well at least you got someone to help you out. Though it was weirdly easy to convince him.
    ~char1_in_party = true 
        + [Continue]
        -> townCenterOptions
    }
    
    =searchForBird
    // simple search for bird, count up actions, if actions too many, assassin do a sneaky and u die
    Time to start searching for {char1}'s bird. {searchForBird > 1 and not (knowledge ? birdLocation): You tried searching for {char1bird} before, but you still didn't know where she was. You ought to try checking places you hand't before in previous loops. {tooSlow >= 1: And you ought to be quicker about it before that assassin caught up to you again.}}{searchForBird > 1 and knowledge ? birdLocation: You already knew where to look for {char1bird}. She was in the flower shop by the boquets. {tooSlow >= 1: All you needed to do was get to her quickly, so that the assassin couldn't sneak up on you.}}
    - (birdSearch)
    {actions_this_loop <= 10:
    
    + (Inn) {not bird_found} [Check around the inn.]
    You decide to check the inn to see if {char1bird} is around.
    + + (InsideInn) [Check inside.]
    You are currently inside of the inn looking for {char1bird}. The innkeeper glares at you the whole time you look, but you ignore them.
    + + + [Check on the first floor.]
    ~actions_this_loop += 1
    You look around the first floor, checking for any sign of {char1bird} but you don't find her anywhere.
    -> InsideInn
    + + + [Check on the second floor.]
    ~actions_this_loop += 1
    You look around the second floor of the inn, checking inside any room that isn't occupied, but you don't find {char1bird}.
    -> InsideInn
    + + + [Go back outside.]
    -> Inn
    ++ [Check around the back.]
    ~actions_this_loop += 1
    You decide to look behind the inn, searching the yard for any sign of the bird, but you do not find her. 
    -> Inn
    + + [Look somewhere else.]
    -> birdSearch
    
    + (Tavern) {not bird_found} [Check around the tavern.]
    ~actions_this_loop += 1
    You go towards the tavern, checking to see if {char1bird} might be around. {TalkToChar2 >= 1: When {char2} sees you from the table that she sits at, she gives you a strange look.}
    + + [Look under the tables.]
    You crouch down and check to see if she might have hidden under any of the tables, but to no avail.
    -> Tavern
    + + [Look up in the rafters.]
    ~actions_this_loop += 1
    You look upwards, searching between the rafters of the building on the off chance she might be up there. You try to jump to get a better look, but you don't see her anywhere.
    -> Tavern
    + + [Look somewhere else.]
    -> birdSearch
    
    + (weaponStall) {not bird_found} [Check by the weapon's stalls.]
    You decide to check near the weapon stalls for any sign of {char1bird}.
    + + [Check by the sword stand.]
    ~actions_this_loop += 1
    You look all around the stand selling swords, the people around giving you strange looks as you do, but you don't see her.
    -> weaponStall
    + + [Check by the spear stand.]
    ~actions_this_loop += 1
    You look near the stall selling spears, glancing between the rows of weapons, but you do not find her.
    -> weaponStall
    + + [Check by the dagger and knives stand.]
     ~actions_this_loop += 1
    You look around the stand selling all manner of knives and daggers. The owner of the stall recognizes you and tells you about all the new daggers that he has is stock, but you keep looking for the bird without acknolwedging him. You find no sign of her.
    -> weaponStall
    + + [Look somewhere else.]
    -> birdSearch
    
    + (Armory) {not bird_found} [Check by the armory.]
    You go towards the armory to loop for {char1bird}.
    + + [Check over by the sets of metal armor in the back.]
    ~actions_this_loop += 1
    You head towards the back near the rows and rows of armor sets. You look behind each of them, but see no sign of her anywhere.
    -> Armory
    + + [Check over by the cloaks and other attire.]
    ~actions_this_loop += 1
    You check the rows of cloaks and other attire, some of which you actually do own, but you don't find the bird anywhere among the folds of fabric.
    -> Armory
    + + [Look somewhere else.]
    -> birdSearch
    
    + (Bakery) {not bird_found} [Check by the bakery.]
    You decide to go over to the bakery to check for {char1bird}.
    + + [Check by the cakes.]
    ~actions_this_loop += 1
    You look by the section of the store with all of the different cakes. Your mouth waters as you walk past. But even after looking, you don't find the bird.
    -> Bakery
    + + [Check by the stacks of bread.]
    ~actions_this_loop += 1
    You check over by all of the different shelves of bread. Seems like a likely place for a bird to end up getting lost, but you don't actually end up finding her.
    -> Bakery
    + + [Look somewhere else.]
    -> birdSearch
    
    + (flowerShop) {not bird_found} [Check inside the flower shop.]
    You decide to check inside of the flower shop for any sign of the bird.
    + + [Check over by the potted plants.]
    ~actions_this_loop += 1
    You look over by the potted plants inside of the store for any sign of {char1bird}, but you don't see her amoung the greenery.
    -> flowerShop
    + + [Check over by the flower bouqets.]
    ~actions_this_loop += 1
    ~knowledge += birdLocation
    You decide to look over by all of the flower boquets. As you look through the arrays of colorful petals, you hear a caw. 
    Your eyes light up when you spot a bundle of black feathers. {char1bird} looks at you inquisitively with small beady eyes. You hold out your hand for her to hop on and she does with a delighted squawk. 
    Now you could return her to {char1}.
    ~bird_found = true 
    -> birdSearch
    + + [Look somewhere else.]
    -> birdSearch
    
    + (Fountain) {not bird_found} [Check by the fountaion.]
    You decide to check around the large water fountain at the center of town for any sign of {char1bird}. Surely this would be the most likely place to find a bird hanging around.
    + + [Check around the outside.]
    ~actions_this_loop += 1
    You look all around the surrounding of the fountain, even undermeath the benches or atop the center of the fountain, but you don't end up finding the bird.
    -> Fountain
    + + [Check in the water.]
    ~actions_this_loop += 1
    You look around the inside of the water fountain, to see if she might be bathing in the water, but you can't see her here either.
    -> Fountain
    + + [Look somewhere else.]
    -> birdSearch
    
    + [Stop looking.]
    {bird_found: Now that you'd found {char1bird}, you ought to return back to {char1}.| You decided against continuing to look for {char1bird}.}
    -> townCenterOptions
    - else:
    ~previous_death = "assassin"
    ~killed_by_assassin += 1
    {bird_found:
    With {char1bird} following close behind you, just as you are about to go find {char1}, you feel a familiar sort of presence.
    {char1bird} lets out a shrill caw of alarm, but before you have time to react, you are stabbed through the middle with a blade. You had taken too long to find the bird, and they had caught up to you unawares once again.
    They really were super hard to avoid weren't they.
    As you fall forwards, the sounds of {char1bird} cawing in panic fading away as your vision fades to black.
    - else:
    Just as you're about to search somewhere else to find {char1bird}, you feel a familiar sort of presence. At this point, you could get a sense of when they were about to sneak up on you.
    But even still, you had no time to react when the assassin stabbed you through the middle. You really were starting to get used to that feeling.
    You fall forwards, pain spreading from your abdomen, your vision fading quickly to black as you watch the assasin walk away from your fallen body.
    
    }
    + (tooSlow) [Wake up.]
    -> wakeUp
    }
    
    
    = ending
    // ENDING SEQUENCE - u win - plot revealed (plot is stupid but thats funny so it okay)
    You quickly formulate a plan with {char1} and {char2}. {char1} gives you a thumbs up, though you do worry how well he'll actually follow instructions. Luckily, {char2} seems to follow perfectly well. 
    The three of you head out to a deserted part of town, that same street where the assassin had found you before. Though really, its just you and {char1} - well and {char1bird} too - that walk out in the open, while {char2} follows in secret. As soon as she hid, you legitimately couldn't find her, or sense her presence at all. Even that assassin was still easy enough to spot once you knew what they looked like. {char2} really WAS intimidating. That's the 8th ranked assassin for you.
    "So, when do you think that assassin will show?" {char1} asks.
    "I honestly have no idea, I just know that they're here. They've gotta be."
    Maybe you would finally figure out why they wanted you dead so badly. And hopefully you'd finally get to see tomorrow after these past {wakeUp} attempts.
        + [Continue]
        It happened quickly. You heard them draw their sword behind you, and {char1} was quick to action, blocking their attack from hitting you with his broadsword. {has_weapon: You drew your dagger too, but you didn't even need to really, {char1} seemed to have it handled for the most part.}
        The two exchange blows, the sound of metal claging against metal. {char1} seems to be doing fairly well, definitely better than you fared, but even he wasn't fast enough for them. You started to wonder where {char2}, you still couldn't see her anywhere.
        But then, the assassin manages to knock {char1} over with a swift strike. He lands on the ground with a grunt, {char1bird} who was flying around above letting out a shrill squawk of fear.
                + + [Jump in to help.]
                {has_weapon: With your dagger drawn, you leap in to defend {char1}.|Even without your dagger on hand, you leap into action, ready to defend {char1} with your bare fists if you had to.}{duelFailure: After what happened that one attempt, when it was just you and him, you couldn't bear to see it happen again.}
                "No, {protagNickname}! Stay back, he's too strong for you!" {char1} shouts. The assassin turns to you, faster than your eyes can track and draws their sword back, ready to put an end to you.
                    + + + [Continue.]
                    But, just as the assassin reaches you, {char2} appears out of nowhere in an instant, her saber drawn. She stabs the assailent right through the heart.
                    They stand their for a moment, grunting in pain, before they collapse onto the ground, their sword clattering to the ground next to them.
                    "Idiot," {char2} seethes at you. "The whole point of me joining was so that you WOULDN'T die, but you almost got yourself killed anyway."
                    "I was trying to save {char1}!" you shout back.
                    She scoffs, "I wouldn't have let anything happen to him."
                    {char1} walks over, "Well at least its all over now."
                    Yeah, but now the assassin was dead, and you still didn't know why they had wanted you dead.
                    {char2} walks over, using the tip of her saber to remove the assasin's hood and mask. Her eyes widden.
                        + + + + [Continue]
                        You shuffle over and finally look at the face of the one who's been killing you in this endless loop. The one who killed you over {killed_by_assassin} times.
                        The three - four - of you stand over the man in a circle.
                        "Who... is that?"
                        "I have no idea," {char1} replies bluntly.
                        Silence.
                        "You guys are dumb," {char2} says, shaking her head. "This is the 10th ranked assassin, or well, he WAS. This is going to be fun to explain to management." She sighs, wiping the blood off of her saber with the side of her cloak.
                        You stand there dumbfounded. Wait, what? Why did he want you dead?
                        "What did you do to piss HIM off?" {char1} asks.
                        You shrug. You really do wish you remembered anything about the night before, but your mind was blank. You'd really never seen him before.
                        You all stand there in silence for a moment.
                        "Well, you guys wanna go get drinks?" {char1} asks.
                        "Sure," {char2} replies sheathing her blade.
                            + + + + + ["I should probably lay off drinking for a while."]
                            You probably should.
                            "Suit yourself," {char2} says. 
                            The three of you walk off into the sunset. {char1} and {char2} wave goodbye once you get back to town and you walk off on your own.
                            You walk for a while, luckily not getting stabbed in the back this time.
                            "Wait I... I still never got any money to pay the innkeeper back."
                            -> END
                            + + + + + ["Yeah, lets go."]
                            Now that the assassin was gone, did it even matter anymore?
                            The three off you walk back into town, the sun setting in the distance. You spend the night drinking again.
                            When you awaken, still bleary eyed, you are met with the sight of the half-rotted wooden ceiling of the inn that you'd spent the night in, sunlight staring to stream in from the window. 
                            You hear the sounds of {char1} snoring on the floor next to you, {char1bird} curled up on his chest.
                            Your head is pounding, you barely remember anything from the night before. The days before? Within your jumbled memories, you just remember the feeling of getting stabbed, a lot.
                            You shake your head and go back to sleep.
                        -> END
                + + [Trust in {char2}.]
                Figuring you would probably end up just getting in the way, you stand back. Just before the assassin's blow lands, {char2} appears, nearly out of thin air, her saber already pulled and pressed against the assailent's neck. They freeze in their tracks, sword still raised.
                {char2} tilts her head, "I advise you drop you sword before I end you life."
                The assalient doesn't hesitate. They drop their sword onto the ground immediately.
                As they do, {char1} leaps back up and pins their arms behind their back. {char2}, using the tip of her saber, removes the assassin's hood and mask. Her eyes widden for a moment, before she rolls her eyes.
                "Wait, who is that?" you ask. You legitimalety had no idea, you'd never seen this guy before.
                The man furrows his eyebrows, "Are you KIDDING me?" he yells at you, struggling in {char1}'s grasp.
                You raise your eyebrows.
                {char2} sighs, "This is the 10th ranked assassin in  the guild."
                "Damnned straight!" he yells, before {char2} points her saber back at him and he promptly shuts back up.
                "What did {protagNickname} do to you? Why do you want him dead?" {char1} demands. {char1bird} lands on the assailent's head and caws at him angrily, pecking at him.
                The so called "10th ranked assassin" glares over at you, "They robbed me!"
                "What? No I didn't! And why would you go as far to kill me for that anyways?"
                "Yes you DID, you cheated! How do you not remember?"
                "Cheated at WHAT?" you yell back.
                "Poker!"
                You freeze... wait. Was THAT what you had been doing last night?
                + + + [Continue]
                {char2} sighs, rolling her eyes again. "No, no {protag} didn't cheat. I get it now. You lost to them fair and square and don't want to admit it. He's always been a sore loser."
                The assasin doesn't say anything. So that was it. You kicked his ass at poker, not even concious enough to remember it, and he tried to kill you for it. That was the big reveal? And this guy was supposed to be only two ranks lower than {char2}?
                You sigh, "I'm so tired."
                {char1} releases him and threatens, "If you come after {protagNickname} again, we'll end you."
                "We?" {char2} asks.
                "Yes WE. The three of us are pals aren't we?" {char1} says.
                "Maybe you two are, but I'm not friends with them," {char2} replies.
                While the two of them argue back and forth, the assassin scampers away, not even bothering with you anymore.
                "But, but {char2}..." {char1} says, pouting. {char1bird} flaps over and gives her the saddest look a bird could muster.
                She closes her eyes contemplating, and then flings up her hands, "Fine, fine."
                She turns to the assassin as he flees, and he freezes in place. 
                "If you try to hunt down {protag} again, WE will end you," she growls, giving him the most terrifying look you'd ever seen. He runs off, hopefully never to be seen again.
                The three of you stand without speaking for a while.
                "Well then, you guys wanna go get some drinks?" {char1} asks, breaking the silence.
                "Yes, please," {char2} replies rubbing her temples.
                + + + + + ["I should probably lay off drinking for a while."]
                    You probably should.
                    "Ah, well then lets all do something else!" {char1} compromises.
                    "Why am I getting dragged into this," {char2} mutters under her breath.
                    The two of you walk back into town, the sun setting in the distance. The three of you end up going shopping. Well, {char1} goes shopping. You and {char2} just tag along. After all, you never did end up making any money today.
                    When you awaken the next day, you are met with the sight of the half-rotted wooden ceiling of the inn that you'd spent the night in, sunlight staring to stream in from the window. 
                    You hear the sounds of {char1} snoring on the floor next to you, {char1bird} curled up on his chest. {char2} lies atop the other bed in the room across from you, sleeping soundlessly.
                    It was finally over.
                    -> END
                + + + + + ["Yeah, lets go."]
                    Now that the assassin had run off, probably scared for his life, did it even matter anymore?
                    The three off you walk back into town, the sun setting in the distance. You spend the night drinking again. {char2} has to keep you from playing any more poker with any of the other customers at the tavern, she makes you vow to it.
                    When you awaken, still bleary eyed, you are met with the sight of the half-rotted wooden ceiling of the inn that you'd spent the night in, sunlight staring to stream in from the window. 
                    You hear the sounds of {char1} snoring on the floor next to you, {char1bird} curled up on his chest. {char2} lies atop the other bed in the room across from you, sleeping soundlessly.
                    Your head is pounding, you barely remember anything from the night before. The days before? Within your jumbled memories, you just remember the feeling of getting stabbed, a lot. And then, vowing to never play poker again? Weird.
                    You shake your head and go back to sleep.
                    ->END
