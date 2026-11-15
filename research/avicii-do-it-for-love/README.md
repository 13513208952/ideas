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

---

## 2026-11-15: livestream successfully recovered from Google Drive 7z volumes — VERIFIED

**Source:** User-uploaded Google Drive folder: https://drive.google.com/drive/folders/1OWpWY3YMzKYK4cObIOYllaODDuSRZPD5 . Eight complete split 7z volumes youtube_videos.7z.001–.008 were individually fetched through the Drive connector (each below 256 MiB), reassembled and extracted with libarchive. Original 1.79GB ZIP was independently visible at https://drive.google.com/file/d/16_KfHkY8SKJjyIp21Jv3p-ewiq7DK_0X/view but could not be fetched whole due the connector's 256 MiB per-file limit. **No need to ask user to retransmit the video.**

**Actual extracted MKV:**
- File name: Avicii Live @ Monument Valley #thecrowningofprinceliam [AH7-hGaH_hk].mkv
- Exact size: **1,789,512,298 bytes**; duration **9677.728 s**.
- Video: H.264 1280x720 30 fps. Audio: Opus 48 kHz / 2 encoded channels.
- SHA-256: `e380b1c2862970509502db9ae33e9a2f79bdc1b85dd58973716e58428efb7c9d`
- Extracted to local model-analysis container in current turn; future sessions should access the Drive volumes if its local path is no longer present.

**Extracted analysis assets in current conversation:**
- `avicii_livestream_analysis/first_hour_audio.opus` (audio first hour, original Opus stream copied, ~45 MB).
- `avicii_livestream_analysis/30m28_to_31m19.wav` (51s lossless-decoded PCM for analysis).
- `avicii_livestream_analysis/33m50_to_34m18.wav` (28s lossless-decoded PCM for analysis).
- `avicii_livestream_analysis/do_it_for_love_30m.mkv` (context video 30:15–31:35, stream-copied).
- `avicii_livestream_analysis/possible_intro_34m.mkv` (context video ~33:20–34:20, stream-copied).
- `avicii_livestream_analysis/three_source_chromagrams.png`, `livestream_to_demo_alignment.png` (CODE-PLOTTED).
- `avicii_livestream_analysis/robust_alignment.py`, `alignment_with_controls.json` (reproducible computations; in conversation runtime, not automatically GitHub).

**Video check:** outdoor, distant camera view with equipment, keyboards, computer and speakers. Cannot reliably read DAW/plugin settings. The livestream soundtrack is a **mix of acoustic pickup of stage playback/voices/ambience**, not an unprocessed dry guitar stem.

### Crucial mono measurement on the original livestream

Although the video audio is coded as two channels, the channels carry nearly the same signal:

| Absolute livestream range | L/R Pearson correlation | Side/Mid power, dB |
| --- | ---: | ---: |
| 30:28–31:19 | 0.9999999432 | −75.47 dB |
| 33:50–34:18 | 0.9999998437 | −71.07 dB |

**Consequence:** The official livestream **does not preserve meaningful original stereo information** in these sections. Never infer Avicii's real DAW stereo reverb/width from these clips. This is separate from Bilibili remake's initially dual-mono opening and does not resolve where B's stereo may have been lost.

### Direct THREE-WAY comparison (pitch-class chroma, exploratory)

Methods: 22,050Hz mono; STFT 4096 and 1024 hop; 12-bin chroma_stft; smooth over 5 frames; L2 normalization; subsequence DTW using cosine distance with steps (1,1),(1,2),(2,1). **Cost is mean along best DTW path; LOWER is closer and it is NOT a percentage or a proof of identical performance.** Algorithm can over-fit recurring chord loops and cannot independently establish sample identity.

| Livestream clip | Reference | Best matching region in reference | Average DTW framewise cost |
| --- | --- | --- | ---: |
| 30:28–31:19 (51 sec) | A: target 3:36 demo | **21.13–67.62 s** | **0.0767** |
| 30:28–31:19 | B: Respaldo remake | 59.81–108.72 s | 0.1460 |
| 33:50–34:18 (28 sec) | A: target 3:36 demo | 180.19–202.43 s | 0.1318 |
| 33:50–34:18 | B: Respaldo remake | **37.89–65.39 s** | **0.0584** |
| 33:50–34:18 | A, constrained to first 50s | 31.39–49.74 s | 0.1596 |
| 33:50–34:18 | B, constrained to first 50s | 10.54–35.16 s | 0.0645 |

**Control:** Shuffling livestream 30:28–31:19 by 2-second chunks (five trials) while maintaining the original pitch-content distribution increases target A DTW cost to 0.167–0.189 vs observed 0.0767. This is meaningful evidence the matched **sequence** is non-random. The same shuffling of 33:50–34:18 yields A cost 0.133–0.150 versus observed 0.132; thus C2→A alone is **NOT distinctive enough to prove specific segment identity**. C2→B looks more promising but needs further controls on B.

Searching for the FIRST 10 seconds of B in the extracted livestream 29:30–35:30 yields a strong 10s chroma match around **30:57.4–31:07.3**, cost **0.0468**. Searching A's FIRST 10 seconds in that interval yields only weaker matches (cost ~0.187), not an equally strong identification. The user's impression that the guitar opening sounds close is retained, but one must not assert A and B have the exact same opening notes.

**Interpretation:** The viewer's 30:28 annotation is well-supported by computational musical-sequence matching. The 33:50 'possible intro' remains **possible**, not independently confirmed as the eventual 0–3s intro; it may be a related motif with a different arrangement. This is a structural/harmonic result, NOT identification of real guitar pickup, patches, recording chain, stems, EQ or effects.

**Next:** (a) fine align pitch / MIDI of initial guitar pluck to livestream instrumental segment(s); (b) check more strictly whether 33:50 material is ever the same opening; (c) compare Bilibili remake to its ORIGINAL YouTube audio to investigate channel damage; (d) revisit timbral source search with real note data, and keep comparing A/B/C. Restrict investigation to FIRST HOUR unless user changes it.
