# InterCode: Standardizing and Benchmarking Interactive Coding with Execution Feedback
2024-05-19
## Summary
Because of the drawback of static coding benchmarks, this paper proposes an interactive benchmark InterCode, which can benefit from the interactive code understanding and generation. Applied to interpreted languages, like bash, sql, python.
## Motivation
drawback of static, sequence-to-sequence or auto-regressive fashion:
- no chance to recovery or revision
- disconnection between generation and execution
- little room for human intervention

## Method
**construction**
- environment prepared: docker
- dataset: (query, gold)   (gold is the right execution result)
- reward design
- two metrics: success rate and error %

**interactive**
- intercode-bash:
	- dockerfile defines  a bash environment
	- NL2Bash -> filter out some commands and form 4 sets
	- execution output: graded with a simple lexical similarity function
	- file system change: check the operation list, md5sum hashes each file path to check correctness
	- ![image.png](https://s2.loli.net/2024/05/19/MOIamF2RbAL4gpk.png)

- intercode-sql is the similar. intercode-python straightforwardly uses the MBPP dataset.

**prompting strategies**:
- single turn
- try again: terminate until reward = 1
- ReAct,  Plan & Solve: termination determined by the agent

## Evaluation
![image.png](https://s2.loli.net/2024/05/19/abjPFXDZUrC8NJ1.png)

![image.png](https://s2.loli.net/2024/05/19/cWTwhJ95MiFrj6R.png)
## Strengths and Weaknesses
**Strengths:**
- interactive code benchmark
- the reward function of the bash codes

**Weaknesses:****
- 
## Further Ideas
> “it may be possible to make significant advancements in the interactive coding task with prompting strategies that attempt to elicit reasoning via an appropriate framework that also permits the model to be expressive and creative in devising its own solutions” (Yang 等, 2023, p. 23)

- compiled languages support
- extend to other areas

(the paper has pointed out these two)

