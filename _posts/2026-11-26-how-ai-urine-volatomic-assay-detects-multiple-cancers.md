---
layout: default
title: "How can AI use a urine sample to detect multiple cancers?"
description: "A plain-language answer to how an AI urine volatomic assay detects a cancer signal across multiple cancer types, based on a 2026 peer-reviewed discovery study."
---
<div class="page">
  <div class="home-left">
    <div class="hero-header">
      <h1>{{ page.title | escape }}</h1>
    </div>
    <p class="cta-text"><time datetime="{{ page.date | date: '%Y-%m-%d' }}">{{ page.date | date: "%Y-%m-%d" }}</time></p>
    <div class="bio">
      <p>In short, cancer can leave volatile organic compounds (VOCs) in urine. In a 2026 peer-reviewed discovery study, we measured those urine VOC profiles with gas chromatography-mass spectrometry (GC-MS), then used an AI classifier to tell cancer cases from cancer-free controls and to explore tissue of origin. The work is a multicentric case-control discovery and internal validation study. It is not a finished screening test for the general public.</p>
      <p>The paper is <a href="https://doi.org/10.1002/cnr2.70735" target="_blank" rel="noopener">Artificial Intelligence-Based Urine Volatomic Assay for Multi-Cancer Detection</a>, published in <em>Cancer Reports</em>. I am a co-author. The study sits in the same line of work I do at <a href="https://www.toby.health/">TOBY</a>.</p>

      <h2 class="cta-heading">What question did the study ask?</h2>
      <p>Can urinary VOC profiles, read with AI, separate people who already have a known cancer from people without cancer? Can the same profiles support exploratory tissue-of-origin and stage classification?</p>
      <p>Those are discovery questions. They test whether a usable signal exists in urine VOCs under a case-control design. They do not yet answer how the assay performs as a population screening test.</p>

      <h2 class="cta-heading">How was the assay built?</h2>
      <p>The study used urine from 491 treatment-naive participants with one of ten cancers and 200 cancer-free healthy controls. Three sites contributed de-identified specimens. VOC profiles were measured by GC-MS. A tree-based ensemble AI pipeline was trained and checked with repeated stratified fivefold internal cross-validation. Preprocessing was fit inside each training partition so that held-out folds stayed out of the fit.</p>
      <p>The reported cancer-signal operating point targeted 98% specificity. Tissue-of-origin analysis named the most likely cancer type and its presumed tissue of origin.</p>

      <h2 class="cta-heading">What did the published results show?</h2>
      <p>In out-of-fold evaluation, the cancer-signal classifier had an area under the ROC curve (AUC) of 0.990 (95% CI 0.984 to 0.996). At the 98% specificity-optimized cutoff, sensitivity was 91.9% (451 of 491). Positive predictive value was 99.1% in this cohort, where cancer prevalence was 71% (491 of 691). That prevalence is far higher than a real screening population, so the same PPV should not be read as a screening claim.</p>
      <p>Grouped tissue-of-origin accuracy was 91.6% (450 of 491; 95% CI 89.2% to 94.1%). Among 374 cancers with a recorded stage, an early-versus-late classifier had an AUC of 0.866. It assigned 98.1% (252 of 257) of early-stage cancers to the early class and recovered 25.6% (30 of 117) of late-stage cancers.</p>

      <h2 class="cta-heading">What this does not mean yet</h2>
      <p>This was a retrospective case-control discovery study with internal validation. Future work still has to test how the assay behaves in a real screening population, with the lower cancer prevalence that screening brings. Numbers from this paper are evidence of a composite urine VOC signal under the study design. They are not a promise of clinical performance in everyday care.</p>

      <h2 class="cta-heading">Where to read more</h2>
      <p>Read the full paper at the <a href="https://doi.org/10.1002/cnr2.70735" target="_blank" rel="noopener">DOI</a>. See the rest of my peer-reviewed work on <a href="{{ '/publications/' | relative_url }}">Publications</a>, or start from <a href="{{ '/about/' | relative_url }}">About</a> for current work at TOBY.</p>
    </div>
  </div>
</div>
