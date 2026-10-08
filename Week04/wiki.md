# Wiki 4 — Cathy

## Links

**My project:** [`Breathe`](./Breathe), a two-page SwiftUI breathing guide that uses a timer and audio playback ([README](./README.md))

**Class repo:** [04-Audio-State-Demo](https://github.com/molab-itp/04-Audio-State-Demo)

## Weekly summary

- **Week 01:** [`Garden.playground`](../Week01/Garden.playground), a random emoji garden. First Swift code.
- **Week 02:** [`NYCSkyline.playground`](../Week02/NYCSkyline.playground), an ascii New York skyline built by loading text files and combining them line by line.
- **Week 03:** [`MoodPrint`](../Week03/MoodPrint), a multi-view SwiftUI 10print where your mood picks the colors, line thickness and slant.
- **Week 04:** [`Breathe`](./Breathe), a breathing guide where time and sound lead you through each breath.

## Progress

- Read through `CountDownTimerView` and `PlayAudioView` in 04-Audio-State-Demo to learn `Timer.publish` and `AVAudioPlayer`.
- Wanted sound to *guide* the user, not decorate. Each phase has its own tone: rising for in, falling for out, and a bell for hold. You can follow it with your eyes closed.
- Stored each pattern as an array of `Phase`s (name, seconds, sound, circle size). The timer counts down, then moves to the next phase and wraps back around.
- Animated the circle with `.animation(.easeInOut(duration: phase.seconds))`, so it takes the whole phase to grow or shrink.
- Generated my own `.wav` tones with a short Python script instead of downloading clips.

## Questions

- `Timer.publish` ticks every second. Would `TimelineView` give a smoother countdown, and when should I use one or the other?
- How do I keep the sound playing when the phone is on silent or the screen locks (`AVAudioSession`)?
- Could the app listen to your actual breathing with the microphone instead of only guiding it?
