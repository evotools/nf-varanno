#!/usr/bin/env nextflow

/*
 * Enable DSL 2 syntax
 */
 
nextflow.enable.dsl = 2

include{
    getVariantScore
} from '../processes/enformer_processes.nf'

include{
    formatting
} from '../processes/pre_processing.nf'

workflow enformer {
    formatting(params.path)
    getVariantScore(params.enformer_prefix, formatting.out.enformer_ch)
}
