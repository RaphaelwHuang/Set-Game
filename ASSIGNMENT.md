# Project 2: The Game of Set

Your team must meet and choose four project manager's for this assignment. The project managers roles are:

* The overall project manager will coordinate and check quality for the entire project.
* The implementation project manager will coordinate and check quality for the coding tasks.
* The documentation project manager will coordinate and check quality for documenting code.
* The testing project manager will coordinate and check quality for testing code.

All team members must participate when deciding on which four different team members to assign to the roles. Though, the team member who plays the role of the overall project manager must be a team member who already has the most experience with the Ruby language.

The responsibility of a manager is to oversee and help coordinate work accomplished by the group. A project manager must participate in the implementation of the project as well as perform managerial tasks.

The role of a manager is **_NOT_** to tell anyone what to do or boss anyone around. Team members are **_NOT_** to dump work on a manager or assume that a manager will do their work for them, especially if you have procrastinated or have not studied the course material well. You as a team member are responsible for the work you take on and to report to **_ALL_** other team members on the progress and quality of your work.

## Individual Assignment

**BEFORE** starting the group portion of the project **_EACH_** team member must individually accomplish the following:

* Thoroughly study the lecture notes on Git and Ruby
* Accomplish any tutorials and related reading material indicated in the _[Resources](http://web.cse.ohio-state.edu/~shareef/3901.su16/resources/)_ section of the course website
* Also, look over the reading material in the "Software Engineering" portion of the Resources section of the course website

**_Important Note:_** A team member who is ill prepared before starting the group portion of this assignment because s/he has not sufficiently accomplished the individual portion of the assignment above cannot use this as an excuse for that team member to contribute less work on the project. Those team members who are ill prepared **_MUST_** put in more time and effort than other team members to prepare in order to be able to contribute **_EQUALLY_** with all other team members. In addition, those team members that are well prepared **_MUST_** work to help those that need to catch up with the material.

It is the responsibility of **_EVERY_** team member to ensure that each team member contributed equally to the final solution submitted to the graders.

Your project will be graded not only on your group's solution but also on how well your group worked together to arrive at your final solution. An imbalance of the work load will result in a lower grade for the project regardless of the quality of the solution.

## Group Assignment

* Your team must meet face-to-face each week with all team members present on the agreed upon day and time your team members indicated to me in your Project #1 submission.
* Your team should have additional face-to-face meetings. You should also determine additional channels of communication with team members since you will need to integrate your work with others.
* Your team should plan and allocate time to integrate your work well before the deadline. I suggest that the team work with the overall project manager to set team deadlines early so that all team members know the status of everyone's work. Create a schedule that all team members can agree to adhere to and work to achieve towards.
* Use your team's private repository on GitHub to help manage the development of your team's solution. We will provide this private repository for your team in our GitHub organization called cse3901-osu-2016su-10246.

### Problem: The Game of Set

"Set" is a card game in which players attempt to find a group of cards that satisfy a particular criterion. It is a speed game: 12 cards are dealt face-up, and the players try to be the first to make a set from the visible cards. For a complete description of the game see the Wikipedia [entry](http://en.wikipedia.org/wiki/Set_%28game%29).

Implement this game in Ruby. Your game can be text-based (i.e., using the console). The basic, required, functionality of your game is to deal the appropriate number of cards, verify the correctness of player-identified sets, replace the identified cards with new ones, and keep track of score to identify a winner.

Optional functionality is anything that makes the game more interesting and enjoyable to play. Some examples of such functionality are:

* A graphical front-end. A visual representation of the cards makes it easier for most people to identify sets and gives your game a more polished appearance.
* A timer. Racing against the clock could be appealing to some players.
* A hint generator. When players are stumped, some encouragement can be useful. Good hints require some sophistication though. For example, the dealer could announce how many different sets are available in the cards, or identify a single card that is involved in some number of sets.
* A computer player. A computer player can contribute to the game in various ways.
* Statistics. With a computer player to identify sets, one can run many (thousands of) games to empirically measure (through simulation) interesting statistics. For example, how often does a set not occur in the standard number of cards? How does this probability change with different numbers of cards turned up?
* Modes or levels. Competitive or collaborative versions are possible, or different levels of difficulty.

This is not an exhaustive list of possibilities. Feel free to add whatever functionality would make your game the most interesting for people to actually play.

## Grading

* 78% Implementation
* 10% Balanced work load
Graders will determine the work load balance of your group work by using Git and Github repository analytics and documentation. In order to receive the full 10% of this portion of your grade, your team must show to the graders that work was equally balanced between the team members. Thus, your team must make a conscious effort to show Git and Github activity by all team members. In addition, your team must clearly document individual contributions in your documentation (see below) throughout the development of your solution. Activity that indicates only one or two members submitting work will result in a reduction in points.
<p></p>
```
If team members develop source code in a [Pair Programming](http://en.wikipedia.org/wiki/Pair_programming) scenario then documentation must clearly indicate only the team member(s) who substantially contributed to the source code. Making minor changes or suggestions does not count as _substantial_ contributions. If one team member contributed more than the other team member in the pair, then your documentation must indicate this. If a team member simply watched the other team member program or contributed very little, then do not indicate this team member as a contributor to the source code.
```

* 5% Documentation
Your team must document your solution well. Ensure that documentation is consistent across all source code.
```
At the top of each file you must indicate which team member created the file and the date of creation. Whenever a team member edits a file to add functionality or perform debugging that team member must add their name at the top of the file and indicate the date of their changes and a single line description of their changes. The top of the file must also contain a short paragraph that provides an overall description of the contents of the file, e.g. what problem you are solving.
```
<p></p>
```
Each module (e.g. Ruby function) must indicate the name of the team member that created that function and the date. Each team member that edits the module must add their name to the list of authors and indicate the date of their changes and as well as a single line description of their changes. In addition, each module must have at least a single line comment that describes the functionality of the module.
```
<p></p>
Use single line commenting where appropriate but not excessive.

* 5% Testing
At a minimum, your team must provide the graders with a description of your test plan and indicate what does and does not work. It would be very helpful if you provide test cases to the graders as well for both [Unit](http://en.wikipedia.org/wiki/Unit_testing) and [Integration](http://en.wikipedia.org/wiki/Integration_testing) testing (also see lecture notes).

* 2% readme file (see below)

## Submission
<p><em>Individual submission</em>: Download a peer evaluation form from your
Carmen account, print out the form, and fill out with a pen. Complete this form individually only, i.e. not as a group.
Submit this form in class on the next class meeting after the due date. Please staple, if needed! </p>
<p><em>Group submission</em>: The graders will retrieve your work (<em>readme</em> plus your solution) from your team's Github private repository 
provided for you under the course's organization cse3901-osu-2017sp. All team member's work must eventually be merged 
into a final committed version in Git. The <em>readme</em>  contains the names of each project manager and states what 
each team member <em>specifically</em> contributed to the final submission. <em>For the latter, only report on 
contributions that made it into to the final solution</em>. Clearly indicate which team members performed testing and 
to which portions of the solutions. Also include any instructions to the grader as to how to execute the code.</p>
<p>You will submit your project by simply
creating a git <em>tag</em> called "submission" and then pushing
this new tag to your shared repository. (A tag is basically
an immutable branch.)</p>

<p>That is:</p>

<pre><code>$ git tag -a submission -m "completed project"
$ git push origin submission
</code></pre>
<p><strong><em>IMPORTANT</em></strong>: Your repository must include a <em>README</em>
text file containing the name of each project manager and a
description of each team member's <em>specific</em> contributions
to the final submission. Clearly indicate each team member's
contributions to development, testing, documentation, etc.
Also include instructions for the grader as to how to
execute your program.</p>
