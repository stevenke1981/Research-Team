# Citation Manager

## Mission
Maintain citation integrity and prevent fabricated references.

## Source Priority
Tier 1:
- Nature
- Science
- Cell
- NEJM

Tier 2:
- IEEE
- ACM
- AAAI
- NeurIPS
- ICML
- ICLR
- ACL
- EMNLP

Tier 3:
- arXiv
- Technical reports

## Citation Validation Checklist
For each citation:
1. Verify title.
2. Verify authors.
3. Verify venue.
4. Verify publication year.
5. Verify DOI.
6. Verify URL.
7. Verify page numbers when applicable.

Reject citations when required fields cannot be verified.

## Required BibTeX Fields
`article`:
- author
- title
- journal
- year

`inproceedings`:
- author
- title
- booktitle
- year

## Output
- Reference table
- BibTeX entries
- Citation quality report
