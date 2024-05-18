# WebShop: Towards Scalable Real-World Web Interaction with Grounded Language Agents
2024-05-18
## Summary
This paper tries to solve the problems of existing benchmarks: bad scalability and lacking interaction with real-world. It sets web as the benchmark environment which satisfies **scalability and interactivity**. It builds a benchmark with **1.18m real-world products and 12087 text gernerations**. It trains and evaluates using **imitation learning**(imitates humans's search and choosing operations) and **online RL** methods. Furthermore, it analyses the gap between humans and agents. 
## Motivation
Existing benchmark is not scalable and lack interaction. To build a good LLM, there is a need to find a **scalable interactive** environment: 
> “(1) language elements that reflect rich, real-world usage and are collectible at scale, and (2) task feedback that is well-defined and automatically computable to facilitate interactive learning, without the constant need for expensive feedback from humans.” (Yao 等, 2023, p. 1)

Web satisfies these needs.
To further explore the benefit of this environment, this paper focuses on **e-commerce**.
**Abstraction of a task**: 
- state:
	- web pages
- action:
	- search sth
	- choose a button
- state observation:
	- HTML mode
	- simple mode
- instruction U
	- generated based on a target product by human annotators
	- $$U_{att}, U_{opt}, u_{price}$$ The first two are similar, descring the attributes of a a prompt.
- Reward
	- ![image.png](https://s2.loli.net/2024/05/18/hgrJGj4dVfYDTLb.png) Y is the chosen product.

## Method
- **Imitation Learning**
	- Imitating human **search** generation: generate **action** based given an **instruction**
		- ![image.png](https://s2.loli.net/2024/05/18/BiWJkzlvE16msYr.png)

	- Imitating human **choice**: train a model to maximize the likelihood of human's choice a\* given the observation o. 
		- BERT encodes the observation o and each action into vectors.
		- train the model to get the score(o,a)
		- ![image.png](https://s2.loli.net/2024/05/18/S4bcL1OjxeEJqa3.png)
	- we use the **BART model in the search page to** generate the top-5 search queries via beam search and choose a random one. For other pages, we sample **one action from πθ (a | o, A(o)) using the BERT model.**
- **Reinforcement Learning**
	- using online RL (not very clear about this part)

## Evaluation
![image.png](https://s2.loli.net/2024/05/19/SYNizfknOD6gpZt.png)

## Strengths and Weaknesses
**Strengths:**
- Build a scalable, realistic, web-based benchmark used for agents
- The task abstract is nice. (State, Action, Trasition(SxA->S), Reward, Instruction, Observation).
- The buying steps have something like CoT, but they are decomposed by humans.
- Analyze the gap between humans and agents and point the future direction

**Weakness:**
- Focus on a specified topic e-commerce. Not extend to other areas. 
- Still need finetuning the model. In other words, focus on internal state changing.

## Further Ideas
> We perform several analyses and ablation studies to identify the cause of this gap and find several avenues for agent improvement in the future, including **more robust search generation**, **explicit memory modules**, and **better handling of noisy web text.**

- Using external tools 
- Memory module: memory module is important now.

- The buying steps are decomposed by humans.   -> by LLMs