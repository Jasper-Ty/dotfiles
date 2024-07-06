# starship

[starship](https://starship.rs/) is a customizable (and cool!) shell prompt.

I'm mainly using this because I didn't want to know more shell and terminal wizardry than I needed to get things like git status on my shell prompt.

## "Frozen in the Past" Prompt

![screenshot](/img/prompt.png)

My prompt grays out after hitting return. 
This is based off of [what James Shackleford does with his zsh powerline prompt](https://github.com/tshack/dotfiles/tree/master/zsh). I did this not only because it looks cool, but for the same rationale he wrote:

> I have programmed my prompt to turn gray after hitting return. This prevents my screen from becoming insanely distracting. I like using Powerline fonts for my prompt, but having the powerline prompt reprinted all over the place in full color is just too much.

How I did this in particular was using starship's [TransientPrompt](https://starship.rs/advanced-config/#transientprompt-and-transientrightprompt-in-fish) feature. I have a separate config file identical to my actual one but with every segment in the prompt grayed out. This config is loaded to print the grayed out prompt that replaces the previously printed one.
