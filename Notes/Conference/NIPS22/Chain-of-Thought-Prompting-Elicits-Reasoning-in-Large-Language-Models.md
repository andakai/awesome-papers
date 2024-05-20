# Chain-of-Thought Prompting Elicits Reasoning in Large Language Models
2024-05-20
## Summary
It tries to mimic a step-by-step thought process for arriving at the answer as humans. So it manually composed a set of few-shot exemplars with chains of thought for prompting. This can guide the LLM to do chain-of-thought, which largely improves the performance in various datasets. This phenomenon only emerge as the LLM model becomes as large as hundreds of Bs and for those problems which need complicated reasoning.
## Evaluation
This paper does experiments on arithmetic reasoning, commonsense reasoning, symbolic reasoning.
![image.png](https://s2.loli.net/2024/05/21/2BQKMO1UjhZIdTa.png)
Let's emphasize on its ablation study of arithmetic. This part analyses probably why CoT works.
- Equation only:
	- To test whether the math equation helps.
	- setup: the output is only a mathematical equation before the answer
	- no effect when the question is complicated
- Variable compute only:
	- To test whether the computation helps.
	- setup: the output is replaced with `...` equal to the total length
	- no effect
- Chain of thought after answer:
	- To test the CoT is not reasoning, but can better access relevant knowledge.
	- setup: put the CoT prompts after the answer (So that when giving the answer, the LLM doesn't rely on the CoT, but CoT process is still inserted into the LLM. The similar idea is adding "think step by step in the end")
	- no effect.

The robustness is concluded by different anatators writing the CoT prompts.
OOD evaluation reveals the CoT can facilitate length generalization.
## Strengths and Weaknesses
Strengths:
- Good prompt engineering
- I think the evaluation and the analysis are nice. It discusses the inner reasons about CoT.

Weaknesses:
- This paper doesn't answer whether the neural network is reasoning
- Manually doing CoT exemplars is prohibitive for finetuning
- No guarantee of correct reasoning path
- Only emerge in large models
- (The above is given in the paper already)
## Further Ideas
- I didn't know such prompt method before. I think it is very inspiring, making people to  think about Is the LLM really reasoning? I am still curious about the third ablation study-Chain of thought after answer. If there exists a completely perfect LLM, give it a prompt, no matter there is a CoT exemplar or not, this LLM will give the right answer. oh we can compare the best LLM to the best optimizer, and other worse optimizers may arrive at a local-best but not a global-best point. Maybe CoT gives a good start to optimize to the best point or a better optimizer. (not accurate analogy). All in all, what I want to express is that, if we have a perfect LLM, there may be no need to do prompt engineering, the LLM itself can reach the right answer. But as the imperfect LLMs can reach the right answer, so the reasoning path itself may already be in the LLM, but CoT makes it clear. (random thoughts)