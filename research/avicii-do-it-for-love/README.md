# Avicii — Do It For Love: reconstruction research log

> **当前状态（2026-11-15）：直播原片已恢复；v1/v2 32.5 秒伴奏及分轨/MIDI 已完成并备份 Google Drive；v2 经用户试听发现显著音色与音符重叠问题；v3 干声版本尚未完成；外部音乐听觉模型尚未实际接通。**
>
> **后续 Agent 请首先阅读：[HANDOFF_CURRENT.md](./HANDOFF_CURRENT.md)** — 中文完整交接，包括实际下载链接、SHA-256、主观评价、失败原因、源码和下一步任务。下文为按时间保留的原始研究日志，部分早期“待上传/待恢复”状态已过时，请以交接文件为准。

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


---

## 2026-11-15: user-discovered NEW livestream occurrence at 12:25–12:30

**IMPORTANT:** The previous search focus on 30:28–31:19 was not exhaustive. User identified **12:25–12:30** as a relatively clean-sounding passage. We inspected the actual full video and decoded audio. The song appears substantially earlier in the FIRST HOUR as well.

### Direct inspection
- Source: original `AH7-hGaH_hk` MKV at absolute **12:25–12:30**, decoded directly to a 5s 48 kHz 24-bit stereo WAV. Also extracted 12:20–12:40 context.
- Source frame at 12:27 clearly shows an acoustic guitar **standing unattended** behind the central workstation, plus outdoor keyboards, laptop and speakers. **This does not show the guitar being played**. There is no visually verifiable isolated guitar stem.
- SRT 12:05–13:12 repeats the verse/chorus lyric passages of **Do It For Love**, despite imperfect ASR wording (e.g. 'where you know my name' instead of 'where you call my name'). Lyrics independently match the song; thus this is an **earlier occurrence of Do It For Love**. 11:00–12:00 includes Swedish chorus/rehearsal discussion and deserves chronological review later.
- SRT 12:22–12:32 contains a sustained vocal/vowel (ASR just 'All'), so 12:25–12:30 is **not safely describable as dry isolated guitar**. It may have less conversation, but the spectrum still contains multiple simultaneous components.
- User-identified cleanliness is a valuable listening report, and should be tested against objective source-to-noise / overlapping-component measures, NOT denied on the basis of mere waveform complexity.

### Chroma matching — exploratory
Same 12-bin chroma_stft + DTW-cosine method as preceding analysis (22,050 Hz, STFT 4096, hop 1024, 5-frame chroma smoothing). Scores are **NOT timbre similarity or proof of identical recordings**.

| Livestream query | Compared with | Best matched section in reference | Mean per-frame DTW cost |
| --- | --- | --- | ---: |
| **12:25–12:30** (5s) | Target A 3:36 | **35.20–39.20 s** | **0.0747** |
| 12:25–12:30 | Respaldo B 3:27 | 51.32–55.59 s | 0.0840 |
| 12:25–12:30 | Target **FIRST 10 s only** | 6.97–9.94 s | **0.1498** (weaker) |
| **12:20–12:40** (20s) | Target A 3:36 | **28.98–44.12 s** | 0.1270 |
| 12:20–12:40 | Respaldo B 3:27 | 46.63–62.69 s | 0.1290 |
| 12:20–12:40 | **later livestream 30:28–31:19** | **30:38.91–30:54.38** | **0.1363** |

**Interpretation:** The user found another actual replay/working iteration of the same song, not merely an unrelated sound. However, the 12:25 five-second clip corresponds to the **vocal/arrangement part around 35s of A**, not to the **specific target opening 0–3s**. The shorter 5s chroma query can produce coincidental matches in looping harmonies, so its accuracy is supported by the **longer 20s repeated lyrics/context**, and not the five-second DTW score alone.

### Spectral analysis at 12:25–12:30

- RMS signal level ~0.0588 (raw decode scale; not comparable as perceived loudness across mixes).
- Median spectral centroid ~1.91 kHz.
- Spectral power fraction above 3kHz ~3.47%.
- HPSS *percussive spectral power* fraction ~0.285 (algorithmic horizontal/vertical spectral separation, not an actual instrumental drum/guitar stem).
- For A original intro 0–5s, above-3kHz fraction ~1.58%, HPSS percussive fraction ~0.064. These **different musical arrangements and recording paths** cannot be taken as evidence that one guitar instrument is inherently brighter.
- A matched section 35.2–39.2s has ~10.18% power above 3kHz, HPSS percussive fraction ~0.327; Respaldo matched 51.3–55.6s has ~3.95% above 3kHz, HPSS percussive ~0.214. Live second pass at 30:41–30:46 has ~3.52% above 3kHz, HPSS percussive ~0.181. These are mix-level quantities, not dry-tone measurements.
- The sound has frequent vertical transients against continuous harmonic bands. Unlike A 0–3s, the 5s window **does not contain three widely spaced, individually clean chord decays**. Do not treat it as isolated guitar for neural/spectral cloning.

### New local analysis assets (available in current conversation only)

- `avicii_livestream_analysis/12m25/live_12m25-12m30.wav` — exact 5s excerpt.
- `avicii_livestream_analysis/12m25/live_12m20-12m40.wav` — 20s context.
- `avicii_livestream_analysis/12m25/frame_12m27.jpg`.
- `avicii_livestream_analysis/12m25/live_12m25_vs_two_intros.png` — wave/STFT comparison (unaligned music phrases).
- `avicii_livestream_analysis/12m25/live_12m20_12m40_detail.png` — coded wave, spectrogram and CQT.
- `avicii_livestream_analysis/12m25/livestream_12min_matches_song.png` — chromagram of 12m, target, remake, 30m passages.
- Scripts: `analyze_12m25.py`, `compare_music.py`, `live_repeated_section.py`, `plot_musical_alignment.py`; numeric results `12m25_features.json`, `chroma_matches.json`, `cross_livestream_alignment.json`.

**NEXT ACTION:** Extend source timeline to **11:50–13:15** and compare repeated versions of the same sung passage; determine which local intervals are cleanest for reconstructing individual guitar sounds. Keep user's **priority** of reproducing the exact A opening 0–3s distinct: that particular passage remains unlocated in the livestream. Investigate both the 12-minute and 30-minute instances before declaring the original pluck absent. Continue limiting video exploration to the FIRST HOUR.


---

## 2026-11-15: started independent accompaniment reconstruction (v1, provisional)

**Status:** Rendered a **32.5-second independent SF2 instrumental prototype** from the 3:36 target reference. It is NOT a final-faithful reconstruction. Local conversation package: `avicii_independent_rebuild_v1.zip`, containing full FLAC, separate Guitar/Bass/Atmosphere stems, MIDI, Python renderer, analysis JSON, spectrogram graph and 7-second A/B comparison. The ZIP is a ChatGPT conversation file; not automatically hosted in this repository.

**Evidence-grounded initial decisions:**
- Working tempo **100.33 BPM** (~1.196 seconds per main harmonic event), anchored to strong original intro transients ~1.24, 2.44, 3.65 s.
- Low-frequency harmonic analysis of A over the first 32 seconds repeatedly indicates **E, C, B**, with some **D and G** transitions. These are *bass-root class evidence*, not verified full-chord labels or isolated bass guitar notes.
- Initial chord hypothesis: Em7 / Cmaj7 / Bm7 / Em7, with D→G passing variation around ~7–10 s. Chord extensions, exact voicing and strum offsets are provisional, NOT a true polyphonic transcription.
- Resynthesis uses free **TimGM6mb.sf2**, GM **steel acoustic guitar (program 25)**, electric bass (program 33) and extremely quiet pad (program 88) after ~12 seconds. MIDI notes are rendered independently; **no original recording samples used in the new mix/stems**.
- Reverb/chorus settings are provisional explorations guided by repeated discussions of reverb and reversing guitar, NOT identified Avicii preset parameters. **The new prototype does not claim to use reverse guitar**.
- Removed speculative dense EDM drums from the earliest 32 s. Previous 48s demo and FM simulations remain known poor comparators.

**Initial test only, not success evidence:** Mean across-frequency *log-mel shape* correlation in ~0–3 s is **0.9349**, while the corresponding mean-profile log-mel RMSE is **15.04 dB**. High correlation reflects broad spectral contour and is NOT a psychoacoustic or precise timbral match; the frequency-band relative levels and transient dynamics clearly differ. The source/target may be unaligned by several tens of milliseconds. Independent intro L/R channel correlation ~0.955, wider original intro was measured ~0.590. This version needs further reverb/stereo-early/late separation and better sample/source matching.

**Next systematic improvements:** (1) verify exact guitar voicings by sparse multi-pitch transcription of initial three note attacks, using tempered harmonic candidate pursuit + B remake alignment; (2) characterize original early attack vs late 1s decay and fit stereo impulse response from target, avoiding copying full target audio; (3) select/browse recorded vintage guitar soundfont/preset candidates, not only TimGM6mb; (4) reconstruct actual percussion/synth/bass entry times by onset-energy + harmonic/percussive stem separation, not prefill genre beats; (5) compare withheld attacks & 28–32s with saved reference and produce revised stems.

**Handoff warning:** The 32.5s ZIP includes a 7s A/B WAV that incorporates user-supplied target audio *for listening comparison only*. The separately rendered mix/stems **do not** contain copied source audio. Keep source files in personal research rather than public redistribution. Future sessions should retrieve the ZIP from conversation files or request its reattachment if no longer mounted.


---

## 2026-11-15 — v2 independent accompaniment rendered (32.5 s; provisional)

The user requested continued independent reconstruction, not further searching for livestream guitar source. The experiment produced `/mnt/data/avicii_independent_rebuild_v2.zip` in the ChatGPT conversation runtime. The ZIP is **not** stored in this public GitHub repository (it includes an A/B containing a portion of user-supplied target recording for private research). The independent mix and stems **do not copy audio samples from the target**.

**Deliverables inside v2 ZIP:** `Avicii_Do_It_For_Love_independent_v2.flac` (44.1kHz stereo, exactly 32.50 s), `Guitar_body_independent.flac`, `Guitar_accent_independent.flac`, `Bass_independent.flac`, `Atmosphere_independent.flac`, `reconstruction_v2_editable.mid`, `build_avicii_reconstruction_v2.py`, `v2_analysis.json`, `target_v1_v2_spectrograms.png`, `AB_v1_v2_target_first.wav` (target then v1 then v2, RMS normalized) and README.

**New evidence about the intro:**
- Target attack onsets are **not** just a compact 0.14-second strum per chord. There are strong short-delay follow-up attacks ~0.28–0.31 s after the main attack. Examples: 1.30 and 1.59 s; 3.70 and 3.99 s.
- Spectral pitch clues support the **E3/G3/B3, C3, B2/F#3** grouping, but many visible higher harmonics could be overtones of lower strings instead of independently played high notes. **Exact MIDI is unverified.**
- v2 uses main and delayed accent guitar MIDI **as two independently editable tracks**, not claiming these are actually both played by acoustic guitar.
- The first seven chord onset estimates used by the generator: ~0.09, 1.19, 2.39, 3.59, 4.89, 5.98, 7.18 s (harmonic activation starts); a separate onset-energy peak detector gives higher times ~0.21, 1.30, 2.50, 3.70, 5.01, 6.10, 7.30 s. Difference is measurement definition / attack ramp, not an actual beat shift. Note grid after ~8 seconds is still extrapolated.
- Revised MIDI chord note allocation and velocities via actual **chroma pitch-class fit**, after noticing a first v2 candidate improved average log-Mel but seriously hurt Chroma. Keep such conflicts visible instead of optimizing spectral profile blindly.
- Timbre is **TimGM6mb SF2 GM acoustic steel guitar**, not a proven Avicii patch, with low bass and speculative pad after 12s. Effects are bounded smooth EQ estimated using the original's first ~3s broad log-Mel band contour, plus an **independently synthesized** diffuse stereo side tail. Real original processing chain remains unknown. The target stereo width was deliberately used as a fitting objective, not independently inferred.

**Same-method v1 vs final v2 measurements** (mono per-frame Mel power 80 bands, compare mean log-Mel profile with global dB level offset, spectral-shape Pearson r; chroma_stft 12 bins n_fft4096 hop512 and per-frame cosine similarity):
| Region / measurement | v1 | v2 | Target when applicable |
| --- | ---: | ---: | ---: |
| log-Mel spectral r, ~0.3–3.0s | 0.9384 | **0.9550** | — |
| log-Mel profile RMSE dB, ~0.3–3.0s | 6.497 | **4.832** | — |
| 12-bin Chroma mean cosine, ~0.2–3.0s | 0.8130 | **0.8301** | — |
| log-Mel spectral r, 3.7–6.9s | 0.9270 | **0.9475** | — |
| log-Mel profile RMSE dB, 3.7–6.9s | 6.829 | **5.390** | — |
| 12-bin Chroma mean cosine, 3.6–6.9s | **0.8135** | 0.7932 | — |
| stereo Side/Mid 0–3s | -16.25 dB | **-5.93 dB** | -5.88 dB |

**Key limitations:** The second 3.7–6.9 s measurement interval was NOT used for the automated EQ profile estimation, but **WAS consulted** during manual MIDI/velocity refinements; it is **not a fully blind test**. A higher average spectrum correlation is NOT a perceptual similarity percentage or proof of equivalent timbre. Mono musical pitch similarity is imperfect outside the opening, even after improvement. Source reference is an unofficial MP3 of unverified session provenance. EQ and stereo were adjusted toward the target by design, not recovered producer settings. Significant transient fine structure and note-specific harmonics still differ from the target.

**Next step:** A/B audition v2 vs v1 and target; prioritize true individual note/strum separation and sample-source identification rather than more average EQ. For 8–32s, map actual instrument and drum entry from full target/livestream; avoid arbitrary percussion. Improve stronger testing on fresh nonfit sections and record any user subjective observations.


---

## 2026-11-15 — user listening feedback and audio-language-model plan (important for v3)

**USER'S DIRECT FEEDBACK after auditioning v2:** The target intro is **dry, crisp, bright, energetic / clear**; independently synthesized v2 sounds excessively **soft / wistful / 'artsy'** and **multiple independently audible notes in the original are smeared into a blended chord**. This is a major qualitative falsification of relying on mean-log-Mel similarity as the objective. Tone-source mismatch is involved, **not merely long reverb**.

**Identified v2 arrangement bug:** MIDI collapsed several sequentially plucked notes into ~50 ms chord clusters and inserted another high chord cluster roughly ~275 ms later; each independently reverb-treated stereo layer then overlapped with pads. Approx target transient peaks ~1.30, 1.40, 1.58 sec and repeated near ~2.49, 2.59, 2.78 s. The note stream should represent **per-string or per-pluck sequential note-on + note-off**, or distinct instrument layers if analysis warrants. Do not assert every transient is a distinct guitar pluck without isolating the timbre.

**Proposed v3:** Remove speculative pad and excess diffuse tail; make dry guitar body/individual notes individually editable, shorter overlaps and correct attack times; compare real guitar sample materials (pick hardness, fret/string mechanical noise, spectral inharmonicity) and use short early-reflection tail only if indicated by target. Retain original stereo expansion as a SEPARATE later problem. Tune instrument before optimizing broad EQ again.

**Audio-language-model investigation:**
- NVIDIA **Music Flamingo** dedicated music-understanding 8B model: https://huggingface.co/nvidia/music-flamingo-2601-hf , official hosted demo https://huggingface.co/spaces/nvidia/music-flamingo ; model is ~8B, official tested on A100 80GB, so a stock 8GB RTX4060 Laptop is **not assured** to run it. It can make qualitative timbre/instrument/arrangement observations but not output ground-truth exact MIDI or production chain; music A-LMs can hallucinate. HF demo may have capacity/queue constraints.
- Google **Gemini API audio understanding**, general audio/questioning; audio path may downmix and downsample, not suited to precise stereo/transient analysis: https://ai.google.dev/gemini-api/docs/audio .
- Qwen2.5-Omni-3B supports audio but local stock FP16 setup may exceed 8GB; quantization and CPU-offload are experimental, not guaranteed; and it is less music-specialized than Music Flamingo.
- For faithful rebuilding, combine language model audio perception with **onset/pitch source-level computation** and user listening; CLAP/audio embeddings alone may ignore note order and timbral fine detail.

**New model-ready AB asset uploaded to user's own Drive:**
https://drive.google.com/file/d/1bXGyezYEWADpe5zs0IcKKep46irm5MUc/view 
Title: `Avicii_Original_vs_v2_intro_8s_AB.flac` (2.28 MB, 17s stereo FLAC, 44.1 kHz). Content: **0–8 seconds target original**, 8–9 seconds silence, **9–17 seconds independent v2**. RMS-matched by reducing v2 gain by ~3.38 dB, without dynamic compression; 20 ms boundary fades to avoid switching artifacts. Good for asking music-understanding models to compare *note separation, attack brightness, short decay, reverb softness, mechanical string timbre* and output a prioritized error diagnosis; not for stereo analysis if the model folds to mono. Upload this to official Music Flamingo demo via its UI; no demo invocation has been performed in current ChatGPT runtime.


---

## 2026-11-17: livestream-inspired v3 FX experiments, **not yet faithful master**

**User direction:** stop hunting for the original guitar recording, keep rebuilding; test **actual production ideas mentioned in the 2016 livestream**, while preserving their crucial listening feedback: target guitar sounds *crisp, bright, energetic, dry*, v2 sounds *soft, wistful and individual notes become blended*.

**Directly reopened actual full Swedish auto-caption SRT** from uploaded source, rather than relying only on earlier summaries:
- **06:16–06:18:** “sätter vi en liten reverb på den” (a little reverb), then **06:47–06:50:** “riktigt episk reverb”; sound target may be vocal/another component, NOT independently identified as intro guitar.
- **10:41–10:43:** question “Vill du ha reverb?” affirmative. Also may concern vocal performance.
- **30:14–30:22:** proposal “Typ dist-distar och reverb och allt sådär”, distortion/reverb etc; not proof any particular sound in eventual master was actually treated this way.
- **33:29–33:46:** “i pre-en att reversa en gitarr”, record/play a chord for prechorus, reverse and fade in, keeping a silence/contrast before chorus. This is the most specifically relevant guitar-processing suggestion. It suggests **reverse CHORD audio before chorus**, not reversing the intro guitar for the whole song, nor necessarily a reverse reverb. Captions are automatic; exact nuances are uncertain.

### Actual independently rendered experiments

**Final corrected research package** (user's own Google Drive, ZIP ~30 MB):
https://drive.google.com/file/d/1vh6SiZBt4xOBNJI4xTQyitdyJKVrX4UV/view

**Listening gallery (~40s)**: https://drive.google.com/file/d/16PMvsD1Prc1pJ8zYCgEl9OYCBus8DR6o/view
Sequences within: **0–8s dry**; **8.75–16.75s short room (380ms)**; **17.5–25.5s soft saturation + short room**; **26.25–34.25s deliberately exaggerated long reverb (2.35s) as negative control**; **35–40s reverse guitar chord swell before a new attack**. Last demo contains music from 8–13s of separate example and is at **arbitrary illustrative location, not the actual documented prechorus placement**.

**Pitch-corrected ~32.5s working candidate**: https://drive.google.com/file/d/19kRBzZHZjkhBPxKROU3-pPJWGK5N66vL/view . Candidate is short-room dry-biased separate guitar with quiet prior independently synthesized bass, NO pad and NO reversal in intro. Musical arrangement after ~8s remains highly speculative.

**Private target / v2 / v3 first-8s A/B WAV:** https://drive.google.com/file/d/1URJMijgK1PU0AZxdEs8vL1Diz92uflGz/view

Contents of ZIP include individually rendered FLACs for all five effects, stereo guitar, v3 candidate, MIDI, source generators `build_experiments.py`, `add_chroma_guard.py`, `pitch_probe.py` (if bundled; verify), `package_results.py`, notes, full objective graph, comparison files. Original target audio is present **only as 8s private A/B** and is never inserted in the independently generated stems. The SF2 remains **TimGM6mb GM Steel Guitar program 25**; its real authenticity is UNVERIFIED and may be the main timbre mismatch. No assumption that Avicii used the effects.

### First-principles onset decomposition

Bandpass 1.8–8kHz, 10ms RMS hop at 22.05 kHz, gaussian smoothing and peak detection:
- Target has clear sets **1.317, 1.427, 1.606**; **2.514, 2.634, 2.804**; **3.712, 3.831, 4.011** sec (plus a smaller 4.111s event).
- V2 gives approximately **1.217, 1.517**; **2.434, 2.714**; **3.662, 3.931** sec, i.e. premature and broader two-stage attacks.
- v3 places *independent individual note-ons* at approximately 0, 112ms and 294ms relative to a harmonic group. After synthesis, output peaks include **1.317, 1.417, 1.616**, **2.504, 2.804** (some missing high-band peaks), **3.702, 3.811, 4.001**. The closer onset match is **FITTED directly to the target's detected peaks**, so it validates implemented timing not independently proven transcription.
- V2 grouped ~6 notes at two close timestamps, leading to masking; v3 tries only 3 separate notes without the massive upper-chord clusters. If underlying recording actually layers multiple instruments, v3 may still be missing voices.

**Crude high-band energy tail-to-attack ratio within target group ~1.3–2.3sec**, not a pure instrument/reverb measurement:
- target **−11.04dB**
- v2 **−7.00dB** (excessive sustained energy)
- v3 dry **−12.71dB**
- v3 380ms short room **−12.45dB**
- v3 saturation + short room **−10.71dB**
- v3 large 2.35s reverb **−7.87dB** (roughly v2-style smear; serves as negative control).

**Voicing experiment** (source-informed, not proved): Original direct target chroma for C chord group features C/G/B; original v3 guessed **C–G–C**, causing missing B. Replacing with **C–G–B** improves agreement. Similarly the next B-group was **B–F#–B**, whereas the target has strong F#/A/D classes; changing candidate to **B–F#–D** improves agreement. A quick candidate grid tried alternative triads against *target windows*, not a blind evaluation. Exact octaves and harmonic-vs-note ambiguity still need study.

**Same-method pitch-class/chroma cosine, time-aligned, first 7s:**
- target vs **v2**: **0.830** over 0.3–3.0s, **0.808** over 3.7–6.9s.
- target vs **early v3 with erroneous voicing**: about **0.703**, **0.686**.
- target vs **pitch-corrected main v3 (short room + quiet independent bass)**: **0.811**, **0.780**. => Nearer than naive v3 but still BELOW v2, even though onset temporal structure is more faithful.
- a proposed added upper-layer v3 scored ~**0.771**, **0.704**, so was not chosen. This is important negative evidence against simply reintroducing 6-note clusters.
- Audio comparison and metrics are still restricted to a **reference-influenced** tuning region; no blind holdout. Timbral authenticity remains unresolved.

**Interpretation:** This iteration is an honest **controlled FX and articulation research kit**, not a v3 final master. The new short-room version is an *onset/decay candidate*. Distortion may help brightness but it reduces some distinct onset peaks; exaggerated long reverb blurs articulation and is not recommended for the opening. Reverse chord sounds structurally appropriate as a separate prechorus demo, but its real use in final target is NOT proven. Preserve all note/processing options independently editable.

**Next work:** audition the effect gallery; ask user which segment helps the sought crispness (but do not demand immediate feedback to proceed). Locate timbral source better (sample/plucked transient material), reconstruct actual multi-pitch note attacks and separate overlapping instrument layers. Limit claims about original production chain to observed captions, keep comparing to target and to fan remake, with explicit stereo limitations.


---

## 2026-11-17: user identifies the first SECOND as a single evolving "magnetic" gesture (high priority)

**User's informed listening report:** In Adobe Audition with **pitch-preserving 1/20 speed**, the first 0–1 second is perceived as **ONE phoneme-like / one coherent timbre gesture**, not successive plucked notes. The gesture has trembling, flowing tide-like swelling and receding, and a bright, magnetic, vintage-electronic tonal character. User rejects the existing simple SF2 guitar + static EQ + reverb as fundamentally missing this time-varying timbre. This is important subjective auditory evidence: do not overwrite it with ungrounded assumptions that every waveform ripple means another note.

**Fresh numeric examination of exact original `/mnt/data/Avicii_reference_0-1s.wav`:** 44.1 kHz two-channel PCM, collapsed to mono for spectral-envelopes only; fourth-order bandpass in 180–500, 500–1600, 1600–4000, and 4000–10000 Hz; smooth instantaneous squared band signal with Gaussian sigma 8 ms and take sqrt, each band normalized to own peak. This normalization does NOT mean the bands have equal absolute power. Code: `/mnt/data/analyze_avicii_single_gesture.py`, plot: `/mnt/data/avicii_first_second_dynamic_envelopes.png` (conversation assets).
- Near-silence ~0–0.16 s; audible onset builds from ~0.16 s rather than instantly attacking.
- Original overall smoothed RMS peaks at **~0.678 sec** (not at first onset); broad high-frequency band 4–10k peaks at **~0.41 sec**.
- Relative 4–10 kHz energy from its own peak: ~−1.6dB in 0.40–0.45s, ~−11.4dB in 0.65–0.70s, ~−24.8dB by 0.95–1.00s, while 180–500Hz band remains close to its own peak (~−1.7dB around 0.65–0.70s).
- 500–1600Hz maximum ~0.68s; this **frequency-dependent envelope motion** is real, not explained by simple one-shot uniform decay. High-frequency energy shifts earlier than low/mid envelope.
- Some band envelope oscillations occur, but this analysis alone does NOT identify periodic phase/FM modulation or any particular effect, nor prove exactly one note played.
- V2's overall smoothed RMS peaks ~0.156s; its 4–10k energy has artificial separate rises near 0.1 and 0.4s corresponding to hard MIDI clusters. Structural mismatch with slow-building original sound.
- **Priority of next experiment:** treat first 1 s as ONE evolving sound-object to model: layered source/single-strike -> nonlinear/varying high-band envelope -> time-dependent resonant/comb/phase modulation -> optional tiny stereo diffusion; avoid brute-force multi-note chords + long reverb. Test a small matrix of modulation candidates *separately* including phaser, flanger, resonant low-/band-pass filter sweep, chorused micro pitch/delay, envelope/reverse-swell and saturation. Recreate target's per-band envelopes and finer harmonic/phase features, then audition at normal and pitch-preserving slow rate. Phaser/flanger are candidate classic vintage effects, **not confirmed used by Avicii**. Account for time-stretch artifacts and distinguish actual rapid tremolo from apparent beats due to harmonic interference.
- Important terminological distinction: a single auditory “syllable” / sonic gesture can contain multiple harmonic partials and/or layers; it does not establish one fundamental note or one acoustic source. Similarly, multiple amplitude peaks do not automatically imply multiple MIDI notes.

**Avoid** optimizing only average log-Mel profile or filling 1 s with three independently audible guitar string plucks. Before adding FX, fit time evolution. Preserve the user's detailed hearing observation as a hypothesis and independently test it.


---

## 2026-11-17 — user ear-matched core timbre to The Smiths "How Soon Is Now?" (high priority)

**Decisive user listening feedback:** Among several historical DSP examples, **The Smiths — "How Soon Is Now?" (intro guitar, ~0:00–0:25)** is strikingly **similar in underlying electric/magnetic timbre** to A's first-second gesture. Avicii target is notably **brighter**. Similarity is explicitly **NOT the periodic volume swelling** (tremolo), which user does *not* regard as the common trait. Do not misread this as "Avicii must use a tremolo pedal."

**Relevant source-based provenance on Smiths sound, NOT Avicii equipment proof:**
- Johnny Marr interview (2013): initially dry rhythm guitar track on tape sent to four Fender Twin Reverb amps; Marr and producer manually varied the amps' tremolo, two panned per side. https://www.westword.com/music/johnny-marr-on-how-he-created-the-sound-for-how-soon-is-now-without-effects-pedals-5704969/
- Producer John Porter firsthand corrected production history (2020), especially https://www.guitarworld.com/features/the-smiths-how-soon-is-now-guitar-secrets-producer-john-porter-reveals-the-exhaustive-tonal-sculpting-behind-the-alt-rock-anthem : guitar initially **Roland Jazz Chorus + DI**, later re-amped through 3 or 4 Twin amps; **Drawmer noise gate triggered by LinnDrum cowbell**, plus multiple AMS delays hard-panned in the final mix; slow Leslie on B sections; producer and guitarist differ on several details. Original article https://www.guitarworld.com/features/the-secrets-behind-johnny-marrs-tone-on-the-smiths-how-soon-is-now includes Porter's direct corrections. Initial source plus amp/mic re-recording and layering matter—not only a tremolo oscillator.
- Source's slide guitar harmonizer chain is **different** from the intro's rhythm-guitar chain. Do not mix these as if one effects chain.

**Working inference (NOT verified Avicii chain):** User's timbre similarity strongly suggests trying **electric guitar/pickup-like excitation -> moderately clean amp/cabinet/tone shaping -> modest nonlinear harmonic coloration -> optional multi-mic/phase-slightly-varied layers** with **NO tremolo in reference baseline**. Compare with SF2 acoustic-steel baseline, which is likely mismatched at the *source class* level. Since user hears target brighter, fit the time-varying high-band transients and resonances of A, not uniform treble boost.
- Three controlled tests with same phrase/MIDI: (1) electric guitar DI + bright-clean amplifier/cabinet; (2) same plus mild dynamic coloration/compression/saturation; (3) same plus two subtle phase/delay-spread layers (and separately an optional tremolo control). Crucial: keep time-varying envelope of the first 1s as a separate fitted target; distinguish amp coloration from modulation.
- Try audio audition in normal speed and pitch-preserving 1/20x, but beware time-stretch artifacts.
- User's phrase: similar **“base electronic timbre”**, not similar volume tremolo. Key subjective target: **bright, crisp, transparent, magnetic, internally trembling, one evolving sonic gesture**.


---

## 2026-11-17: V4 "magnetic" core timbre study — electric-guitar signal chain and delayed harmonic bloom

**Direction from user:** The intro in target A has a *bright, crisp, magnetic, tide-like evolving vintage electronic core sound*. The Smiths' `How Soon Is Now?` intro is user-confirmed very similar in **fundamental timbre**, while **its amplitude tremolo is NOT the common feature**; target A is brighter. Do NOT assume target has tremolo, and do not declare the Smiths equipment to be the Avicii signal chain.

**Firsthand contextual source:** Smiths producer John Porter corrected the production history: original recorded guitar via Roland Jazz Chorus and DI, later multiple Fender Twins, Drawmer gate and various AMS delay processing. Producer and Marr differ in recollections. See https://www.guitarworld.com/features/the-smiths-how-soon-is-now-guitar-secrets-producer-john-porter-reveals-the-exhaustive-tonal-sculpting-behind-the-alt-rock-anthem and https://www.guitarworld.com/features/the-secrets-behind-johnny-marrs-tone-on-the-smiths-how-soon-is-now . These explain why **source / amplifier tonal coloration should be tested independently of tremolo**.

**Independently generated V4 listening lab:** [Google Drive folder](https://drive.google.com/drive/folders/1MU1JHpmQ0-SiZGUNR3eIlnQZ8ENnhq9d), complete editable/script package `magnetic_timbre_v4_experiments.zip`: https://drive.google.com/file/d/1TWG4kK9e4jhN9tmn43MRTH-0_uLsj-Lh/view (9.60 MB). Includes source `build_magnetic_tests.py`, `extend_harmonic_exciter.py`, `late_harmonic_bloom.py`, README, FLACs, charts, metrics JSON. Target audio only in private A/B file, not inserted into independent reconstructions. Source samples remain **TimGM6mb SF2** (program 25 steel acoustic, 26 electric jazz, 27 clean electric, 29 overdriven electric). Amp is a simplified filtered/soft-saturation model, *NOT a faithful Roland JC-120 or Fender Twin emulation*. First 4s use unverified simultaneous-note pitch hypotheses; they intentionally do NOT claim individual strings/notes transcribed.

**Three audition galleries in user's Drive**:
1. [Seven timbre-source tests, 7×4s + separators](https://drive.google.com/file/d/1OKkJCL-zzzr9r0vZJXUNAur-NzTk6EaF/view): acoustic control; clean electric DI; clean electric + pseudo-bright-amp; amp + dynamic band movement; jazz electric alternative; overdrive guitar alternative; subtle stereo micro-delay on electric + dynamic movement.
2. [Brightness experiments, 4×4s](https://drive.google.com/file/d/14ls2h5QFsdF7Q3r9yk8sTZTGb-Yc4mdV/view): electric amp+motion baseline; treble shelf; midband-derived harmonic exciter; combined shelf/exciter. This illustrates that EQ boosting alone can fail to create missing harmonics.
3. [Delayed harmonic bloom, 4×4s](https://drive.google.com/file/d/1T0zk43ATVTQAN5gJUsOciE-HnKwVQmZO/view): electric amp+motion baseline; fitted later high-harmonic generation; reduced-level version; no-early-subtraction version.
- [PRIVATE A/B target 4s versus generated variants 3,4,7](https://drive.google.com/file/d/1VQ2b88f-j3eLgtnHV-df44TgoAQxvtDR/view). Research comparison, NOT for public distribution.

### Measured first-second spectral feature and fitted test

Using 6–10 kHz / 700–1600 Hz band RMS relative ratio over **0.22–0.78s** (note: frequency ratio is NOT a psychoacoustic timbre similarity percentage):
| Source | Ratio dB | Error compared to target |
| --- | ---: | ---: |
| Target A original | **−23.88** | — |
| SF2 GM acoustic steel control | −31.63 | −7.75 |
| SF2 clean electric DI | −29.33 | −5.45 |
| SF2 clean electric plus amp approximation | −28.71 | −4.82 |
| SF2 electric+amp+fitted spectral motion | −27.50 | −3.62 |
| GM jazz electric+amp+motion | −40.63 | −16.75 |
| GM overdrive+amp+motion | −30.83 | −6.95 |
| Midband-derived harmonic exciter over electric+amp+motion | **−25.45** | **−1.57** |

**But the bigger discrepancy is temporal, not mean spectrum:** 6–10 kHz smooth RMS is strongest at **0.410s** in the ORIGINAL, but the clean electric + amp + slow-band fit sample peaks **0.166s**, close to its synthesized attack. This is the key reason treble shelving does not create the wanted internally evolving/tide-like sound.

To test *one coherent gesture with electronic timbral evolution and NO extra MIDI attacks*, derive novel high harmonics by applying nonlinear shaping to the **existing 1.5–3.8 kHz partials**, high-pass at ~4.3 kHz, and gate the generated harmonics with a smooth bell centered ~250ms after each initial chord onset; also reduce premature HF attack in the rendered synthetic instrument. One deliberately TARGET-FITTED candidate has:
- original 6–10 kHz peak **0.410s** versus synthesized **0.403s**
- original 6–10k / 0.7–1.6k ratio **−15.00 dB** over 0.37–0.46s, synthesized **−14.91dB**.
These numbers were explicitly used to fit the model on that interval, so matching them is **NOT independent proof** that Avicii used an exciter or that listeners hear the same timbre. Alternate lower-gain candidate keeps the original electric patch transient as the main high-band peak (0.166s); this demonstrates tuning sensitivity. New high harmonics and timbral dynamics are the research direction, not an identified plugin. Note-source and 4s voicing estimates remain unverified.

**Code plots:**
- `first_second_motion_comparison.png` and `first_second_candidate_spectrograms.png` show original vs source/amp vs matched dynamic spectral motion.
- `late_harmonic_bloom_envelopes.png`: original / clean electric baseline / fitted delayed exciter / understated alternative. https://drive.google.com/file/d/1UeocRlnONkWvWJW509TuzaQPNTCL3zAX/view
- No copied original source in synthetic stems. All source-informed fitting, NOT model hearing or blind tests.

**What NOT to conclude:** Source timbre still sounds unverified by an actual music-understanding model or user's new audition; GS electric patches may all be inadequate. Measuring matching amplitude envelope or overall brightness does not establish partial structure, time-dependent phase, formant, picking mechanics, or stereo source equivalence. Continued work should directly audition palette/gallery in normal speed and Audition preserved-pitch slow mode, and if similar proceed to more realistic clean DI source / amp/cab simulation and time-varying narrow-band spectral modulation. Keep first second as a coherent sonic event, with exact pitch plurality unresolved.
