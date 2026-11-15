# Avicii — Do It For Love: reconstruction research handoff

Created 2026-11-15. Status: livestream video upload pending. This is a continuity record, not a verified production history.

## Scope and objective

Reconstruct this exact song's original guitar-like pluck, note pattern, guitar processing, additional instruments, and arrangement as an independently playable multi-track project (MIDI, separate stems, synthesis/sampling parameters). Avoid generic Avicii-like EDM. A FLAC converted from MP3 does not improve source fidelity. The first 48-second experimental replay was significantly different: its pluck pattern and harmony were partly guessed, and its MIDI MUST NOT be treated as an accurate transcript.

Restrict livestream study to **its FIRST HOUR**, especially 30:28–31:19 and 33:50–34:18. The user reports the stream is filmed from a fixed outdoor angle, so the DAW interface is probably not readable. Do not spend time on other songs from later in the video.

Legend: [MEASURED] earlier computational comparison; [USER] user's listening report; [SRT] imperfect automated subtitles; [LEAD] third-party statement; [HYPOTHESIS] unverified inference.

## Materials

**A — primary target:** Uploaded NCM and converted file Avicii - Do It For Love.mp3, 3:36.29, 320 kbps stereo 44.1 kHz. NCM metadata musicId 1850925125, album AVĪCI（02） (Reboot), empty artist field. These tags are unofficial and do not establish an authorized release or that this specific mix is Avicii's final version.

**B — independently played remake:** Uploaded Bilibili MP4, BV1QRzrBPEkZ, credited to The Avicii Respaldo; extracted file respaldo_audio.m4a (~3:27, AAC 48k stereo, ~99 kbps). [USER] Its opening pluck sounds very similar to A but reverb differs; it is an independently performed remake, not identical recording. IMPORTANT: repost/transcode may have damaged the stereo field. Bilibili video: https://www.bilibili.com/video/BV1QRzrBPEkZ/ . Reported original on YouTube: https://www.youtube.com/watch?v=AUCDl605fmA — verify provenance.

**C — Avicii original livestream:** https://www.youtube.com/watch?v=AH7-hGaH_hk , title Avicii Live @ Monument Valley #thecrowningofprinceliam. User has uploaded Swedish .srt and yt-dlp .info.json and is uploading FULL VIDEO to connected Google Drive. Wait for shared Drive link. Metadata: video ID AH7-hGaH_hk; channel Avicii; release_date 20160313; upload_date 20160314; was_live=true; runtime 9678 seconds = 2:41:18. Chosen download format 136+251: 1280x720 H.264 30fps plus 48kHz 2-channel Opus audio, MKV mux, estimated total 1,791,123,737 bytes (~1.79 GB). Two-channel codec is NOT proof the actual soundtrack has stereo width. Do NOT publish full info.json because signed stream URLs and tokens occur in it.

**D — other reconstructions:** Madko 2019 remake and Alex ST remake may offer leads, not original stems. Madko discussion: https://www.reddit.com/r/avicii/comments/dm66a0/avicii_do_it_for_love_feat_sandro_cavazza_madko/ ; more discussion https://www.reddit.com/r/avicii/comments/dhixxr/ . [LEAD] Madko discussed acoustic instruments / guitar recording difficulty. These are not official session metadata.

## Livestream time index from user-supplied viewer comment

* 30:28–31:19 (51 seconds): Do It For Love — PRIMARY.
* 33:50–34:18 (28 seconds): Possible intro to Do It For Love — PRIMARY, still tentative.
* From ~1:00:00 onward viewer lists other songs: Without You, Lord / Feel the Beat, Our Love, Forever Yours, etc. OUT OF SCOPE for now.
* Earlier t=938 seconds / 15:38 was a playback link parameter, not the best evidence for the song. Focus on 30:28 and 33:50.

[PREVIOUS SRT ANALYSIS, UNVERIFIED] Around 30:14–30:27 a mention of distortion and reverb; 31:25–31:55 discussion of verse/pre-chorus/lyrics; **33:29–33:47** proposal to reverse a guitar in a pre-chorus (Swedish approx. 'reversa en gitarr'); ~34:59–35:24 sampling a trial recording. None proves the final target used these techniques. Other early-hour mentions of samples/organ/overdubs may concern DIFFERENT songs. Sparse subtitles at 33:50–34:18 do not mean no music; likely instrumental.

## Previous measured findings, with caveats

* [MEASURED] A intro 0–3 seconds has three prominent pluck-like attacks around ~0.16–0.21, ~1.25–1.34, ~2.44–2.53 sec. Estimated Em/C/Bm-related bass/harmony is still provisional — do not canonize without transcription.
* [MEASURED] 3–9 kHz energy percent in the first transient windows roughly 1.95%, 4.31%, 3.56%; earlier generic synth V2 gave 0.30%, 0.40%, 0.16%. Need crisp complex onset plus slower decaying harmonic body, not just boosted treble.
* [MEASURED] A intro 0–3s L/R correlation ~0.590 and side/mid energy -5.9 dB. B's corresponding opening L/R correlation 1.000 (essentially dual mono), but later B becomes stereo. **Do not ascribe the dual-mono intro to the remaker until checking the original YouTube upload.**
* [MEASURED] In A three attack windows showed side/mid around -7.68, -8.12, -8.19 dB; later tails around -4.25, -5.32, -5.07 dB respectively. Spatial width grows after the attacks. Stereo reverb/delay/doubling is plausible, not proven.
* [MEASURED] A vs B unmatched introductory Mel spectral cosine ~0.843. Not '84% perceptual similarity'; their note events are not fully aligned.
* Previous V2 / V3 / V4 simulated 0–4sec timbre scores: Mel cosine ~0.7499 / 0.7507 / 0.7518; V3 log-Mel RMSE ~1.2649 vs V2 ~1.2822; V4 worse ~1.3907. Differences too small / inconsistent to certify matching. These are within-fit-window metrics.
* The mixed target's 28–32 sec segment contains other parts and possible vocal layers. Do not evaluate its entire spectrum as if it were an isolated guitar tone.
* [USER] Vocal layers described as female and male humming/singing; treat as listening clue, not verified stem attribution.

## Candidate sounds / prior false leads

Possible acoustic guitar or multisampled guitar plus effects; alternatively PCM guitar/pluck or mixed layers. Historical references to test with REAL isolated samples: Roland D-50 Pizzagogo, Picked Guitar Duo and Steel Pick; Korg M1 Guitar / PickGuitar / Kalimba; Yamaha DX7 FM plucks; later PCM sample libraries. **No evidence these exact instruments were used.** Source libraries include SynthMania demos and NSynth / Slakh2100 / Freesound for sound retrieval. Prefer real patches / original demo recordings over hand-coded generic approximations. Compare after pitch/attack/loudness normalization and against held-out windows.

## Priority workflow on receiving the Google Drive link

1. Inspect Drive file metadata, size, MIME. Try authenticated raw download/materialization into local environment. Full ~1.79GB may exceed actual handling limits; do not guarantee success. If necessary, user can upload selected clips or first hour.
2. Preserve downloaded audio coding. Generate lossless PCM for analysis only. Compare livestream **30:28–31:19** and **33:50–34:18**, with nearby context for discussion; first test if the latter is actually the same motif.
3. Align A's first 0–3sec plucks to C's guitar notes (not waveform similarity unless same recording). Look for a less processed guitar performance, but remember C is itself outdoor live audio captured by mic/speakers, NOT a dry stem.
4. Evaluate onset times, CQT/chroma pitches, note patterns, attack/band-specific spectral envelopes, decay, stereo width, reverb; independently compare B and its ORIGINAL YouTube source to diagnose possible Bilibili downmix.
5. Fit and evaluate short 0–3sec independently generated guitar models / actual sample libraries with held-out attacks, then try 28–32sec and larger sections. Keep MIDI, stems, processing parameters, plots and exact evaluation windows.
6. Record every empirical finding back into this file. Distinguish [MEASURED] / [SRT] / [USER] / [LEAD] / [HYPOTHESIS] so future sessions do not confuse guesses with facts.

## Repository and attachment pointers

* ideas/download_youtube_video.sh — yt-dlp full-video download script. Linux: use quotes around YouTube URLs containing ampersands; Deno >=2.3 or Node >=22 plus yt-dlp default EJS extras may be needed.
* Earlier code in conversation: avicii_remake_compare.py for A/B analysis; old synthesized audio, MIDI, reference WAV and plots are ChatGPT conversation attachments, **not in this GitHub repo**.
* This repository contains research text, not downloaded or copyrighted songs/videos. Full livestream remains pending Google Drive link.

## Questions to settle

Is A an authentic unmixed/original late demo or another edit? Is the 33:50 section actually the same opening? Is Bilibili's initial mono caused by resampling/repost? Is original guitar acoustic, PCM/sampler, synthesizer or layered? Which specific processing makes the tail widen? Can the livestream clarify the exact notes and arrangement?

**Carry-forward instruction:** Continue from A/B/C evidence and targeted first-hour clips. Do not revert to the failed generic EDM synthesis plan.