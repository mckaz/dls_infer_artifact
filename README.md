# InferDL Artifact

This is the artifact corresponding to the DLS 2020 paper Sound, Heuristic Type Annotation Inference for Ruby.

## Getting Started: Requirements
  * [Vagrant](https://www.vagrantup.com/).

## Getting Started: Setup

### Vagrant

To use Vagrant to produce a VM, simply clone and navigate into this repo, and call `vagrant up`:
```
git clone https://github.com/mckaz/dls_infer_artifact.git
cd pldi-19-artifact
vagrant up              # Build the VM
```

This build may take some time (~1 hour), as it must download and build all the benchmarks.
After this, you can call `vagrant ssh` from within the same directory to access the VM.

## Getting Started: Navigating the VM

The VM includes InferDL and the 10 apps used as benchmarks in our paper.
InferDL can be found in the directory `~/dsl-infer-rdl`. If you are interested
in seeing the heuristics used during inference, you can find them in
`~/dsl-infer-rdl/lib/rdl/heuristics.rb`.

You can find our benchmarks in the following directories:

* ActiveMerchant: `~/active_merchant_infer`
* Diff-LCS: `~/diff-lcs-infer`
* Minimagick: `~/minimagick-infer`
* Optcarrot: `~/optcarrot-infer`
* Sidekiq: `~/sidekiq-infer`
* TZInfo: `~/tzinfo-infer`
* Journey: `~/journey-infer`
* Discourse: `~/discourse-infer`
* Talks: `~/talks-infer`
* code.org: `~/code-dot-org`

## Running Inference

The instructions for running inference are listed below. In all cases,
when you run inference, a file called `infer_data_new.csv` will be generated,
containing the inferred types for all methods/variables, as well as the original,
"gold-standard" types (if the corresponding app has them). Additionally,
if you open up the Ruby file that triggers InferDL (`infer.rb` for the Rails apps,
and `infer_all.rb` for the non-Rails apps), you will find a list of all methods,
variables, files, or paths for which inference is run.

You will also find a call to the method `RDL.do_infer`, which actually triggers the inference system to run.
This call includes a named parameter `num_times`, specifying the number of times to run
inference; you may change this number if you wish to run it a specific number of times.
Running more than once allows you to calculate the median and SIQR times across the runs.


* To run inference for ActiveMerchant, Diff-LCS, Minimagick, Optcarrot, Sidekiq, or TZInfo,
`cd` into the corresponding directory, and run `pry infer_all.rb`.

* To run inference for Journey, Discourse, Talks, and code.org, `cd` into the corresponding directory.
For code.org, you must be in the directory `~/code-dot-org/dashboard/`. Then, run `rails runner infer.rb`.