---
layout: post
title: "Importance of a decent password strategy"
date: 2017-02-13
categories: [security]
tags: [passwords]
assets: /assets/2017-importance-of-a-decent-password-strategy
excerpt_separator: <!--more-->
---
Passwords are the main thing that protect your online valuables, be it your
emails, Facebook account, or your PayPal. Do you pay enough attention to the
strength of your passwords and do you do everything possible to keep your
passwords secure?

In this post I'll explain why you need to think about your passwords, some of
the risks your passwords are exposed to, and describe my password strategy.

<!--more-->

# Risks
We have passwords everywhere, your e-mail account, social media, web shops, you
name it. So what risks are these passwords exposed to?

## Weak passwords
The passwords could be weak. Anything found in a dictionary is a weak password,
anything under twelve characters is weak. Passwords can be guessed by attackers,
often in a automated process.

## Password reuse
Since we have entered passwords everywhere, we rely on the security of each and
website to keep our password safe. Unfortunately websites get hacked regulary.
Big names like [LinkedIn][1] and [Adobe][2] are among those hacked websites.

When a website is hacked and the attackers got their hands on the user data,
they could gain access to your email and password. The first thing attackers
will try is to login on your email, using the password that was leaked. If they
succeed the ramifications could be huge. Next they might try to login on
PayPal, if they succeed you can probably imagine what will happen next...

In order not having to rely on a third party to keep your password safe, we
need to have a unique password everywhere. I know, that might sound like a
nightmare, remembering dozens of unique passwords. Don't worry you end up
needing to remember only one password!

# Password managers
A password manager stores all your passwords in a safe manner. Password
managers come in two forms, an app that you install on your laptop or phone,
or in the form of a website offering this service. Using a password manager
requires you to remember one strong password, the password manager will
remember all your other passwords! And perhaps even better, you never have to
think of new passwords again. A password manager can generate strong passwords
for you.

[Lastpass][3] is a well known password manager website. Yes, when using a service
like Lastpass you put a lot of trust in that service. However it is their core
business and they will work hard on keeping your passwords safe.

[Keepass][4] is an example of an application that you have to install for it to
manage your passwords. It stores your passwords in a single file. This file is
encrypted using your password (I should say pass phrase, more on this later) so
using a strong password is essential. If someone gets their hands on your
Keepass file, he or she can not do anything with it, unless they know your
password.

# Strong master password
When we make use of a password manager we only have to remember one password.
Since this password will protect all other passwords it needs to be very strong.
What makes a password strong? It should be long and unique dictionary. Note
that I do not mention 'should contain special characters', password length is
way more important than whether or not it contains special characters. A well
known method to generate strong passwords that are easy to remember is the
[Diceware][5] method. With this method you can generate a pass phrase consisting
of multiple words which is fairly easy to remember. Instead of using dice you
could use this [generator][6]. Make sure to read the 'Is it safe?' entry in the
[FAQ][6].

# My password strategy
I use Keepass as password manager and store the password database in my Dropbox
so I can easily access it on my phone, my laptop and my system at work. This is
safe since the password file is encrypted. My master password is created using
the Diceware method and consists of seven words. Whenever I need a new password,
Keepass generates and stores it. Besides my master password I know the password
to my email account, in case I ever need to reset my Dropbox account to gain
access to my Keepass database.

# Think about your password strategy
If there is only one thing you take away from this post I hope it is that you
think about your password strategy. Do you already use a password manager? Is
your master password strong enough? If so, great! If not, make some changes!

[1]: https://www.troyhunt.com/observations-and-thoughts-on-the-linkedin-data-breach/
[2]: https://www.troyhunt.com/adobe-credentials-and-serious/
[3]: https://www.lastpass.com/how-it-works
[4]: http://keepass.info/
[5]: http://world.std.com/~reinhold/diceware.html
[6]: https://www.rempe.us/diceware/#eff
