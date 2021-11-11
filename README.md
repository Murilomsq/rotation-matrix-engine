# Rotation matrix: A solution to a mutiple domain problem

Note: This solution might be costy when it comes to an engine that stores rotations as Quaternions

When working with a character that animates in in a 2D freeform, with a fixed camera, the chacater animation **must** take in count where the player is looking to animate correctly.

### In Unity, the 2D freeform looks like this

![image](https://user-images.githubusercontent.com/56661791/141331426-473cdf69-a847-412d-ae37-536a3d984b68.png)

You get Horizontal/Vertical (WASD) inputs and let them choose what animation to choose from in respect of those paramaters

### When the player is pressing **D** only, the graph looks like this

![image](https://user-images.githubusercontent.com/56661791/141333609-6d88d2b3-3053-49f4-bf22-a000ec08b8fd.png)

As stated before, WASD/Axis inputs control this animation state plane with a simple script

![image](https://user-images.githubusercontent.com/56661791/141333956-3e1e3165-3f03-465b-b4a7-356b34114caa.png)

Now, we need to take this red dot, the result of the input, and bias it in respect of the player orientation. But how exactly shall we do this?
We can, in fact, get the player angle with trivial references, but how are we supposed to bias the animation with that?

### First steps

First thing that needs to be updated is the input domain, which ranges from **-1 → +1** in both axis. This will produce a square in the plane, so we have to modify the inputs to make it resemble a unit circle, that way, we can work better with trigonometric functions. This will be clearer in a bit

To do that, instead of getting the vector directly from the inputs, we get the angle that it produces, and harverst the values from the unit circle with cos(angle) and sin(angle), this will be our new input.

![image](https://user-images.githubusercontent.com/56661791/141344944-59a608ad-4ff1-48c5-a2b0-32386aa92af5.png)

![image](https://user-images.githubusercontent.com/56661791/141350333-e68459b3-5e28-4dfd-8922-f9d149860bcb.png)

Note that we are multiplying the cos and sin by the absolute value of the previous input so it smooths out just like the input does.

With this done, the input will now behave in a unit circle, instead of the old square it looked like.

#### Adding player rotation bias

The player input can be interpreted like a vector in *R2* space, and we have an excellent tool for rotating vectors around the origin and by a certain angle: **A Rotation Matrix**

![image](https://user-images.githubusercontent.com/56661791/141351822-e86aa56f-e540-4d85-8254-e3edc6a9395c.png)

If we solve this rotation matrix we have 
```
x' = x • cos(θ) - x • sin(θ)
y' = y • sin(θ) + y • cos(θ)
```
Bringing this to our code

![image](https://user-images.githubusercontent.com/56661791/141352833-d798e877-a49b-4473-8f97-1b1f821a5fa7.png)

*In my case im suming 135 because my player forward rotation.y is -135*



## Final result looks like this


https://user-images.githubusercontent.com/56661791/141353669-e534c73d-8e98-4b4d-81d1-8366c1dd8509.mp4






