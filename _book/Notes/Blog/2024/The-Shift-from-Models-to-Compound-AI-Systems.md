# The Shift from Models to Compound AI Systems
## Metadata
BAIR
20240218
## Introduction
>**state-of-the-art AI results are increasingly obtained by compound systems with multiple components, not just monolithic models**.

> In enterprises, our colleagues at Databricks found that 60% of LLM applications use some form of [retrieval-augmented generation (RAG)](https://arxiv.org/pdf/2005.11401.pdf), and 30% use multi-step chains.

> it means leading AI results can be achieved through clever engineering, not just scaling up training.
## 为什么使用Compound AI Systems？
> We define a Compound AI System as a system that tackles AI tasks** using multiple interacting components, including multiple calls to models, retrievers, or external tools.**

- 尽管scaling law很有用，但是scaling的性价比不如一个compound system
- 模型是静态的，而一个系统可以是动态的，融入即时的数据
- 一个system更容易控制他的输出，以及通过RAG这样的方式可以让他的输出更具有可信度
- AI模型只有一个固定的输出质量。但在不同场景，对于模型的输出质量要求不同。

## 挑战
- Optimization
	- 模型的优化一般就端到端训练，使用梯度下降更新参数，进行优化。而Compound AI system是由多个模块组成的，需要新的优化方式
	- DSPy优化了预训练模型和其他组成部分的流水线工作，而其他的LaMDA, Toolformer, AlphaGeometry是在模型训练的时候进行tools-specified的优化
- Operation：
	- **Monitoring:** How can developers most efficiently **log, analyze, and debug traces** from complex AI systems?
	- **DataOps:** Because many AI systems involve data serving components like vector DBs, and their behavior depends on the quality of data served, any **focus on operations for these systems should additionally span data pipelines.**
	- **Security:** Research has shown that compound AI systems, such as an LLM chatbot with a content filter, can create [unforeseen security risks](https://arxiv.org/pdf/2309.05610.pdf) compared to individual models. New tools will be required to **secure these systems.**

## Paradigms
- 设计AI systems：
	- Component libraries：langchain, llamaindex
	- agent frameworks：AutoGPT, BabyAGI
	- tools for controling LM outputs：Guardrails, Outlines, LMQL, SGLang
	- 新的推理方式：COT, self-consistency, WikiChat, RAG
- **Automatically Optimizing Quality**:
	- [DSPy](https://arxiv.org/pdf/2310.03714.pdf) is the first framework that aims to **optimize a system composed of LLM calls and other tools to maximize a target metric**.
- **Optimizing Cost: 
	- FrugalGPT and AI Gateways

- **Operation:**
	- 在执行过程中，需要跟踪应用的steps
	- 跟踪、可视化、评判输出：LangSmith, Phoenix Traces, Databricks Inference Tables
	- 利用监控得到的反馈：DSPy Assertions
	- 利用AI来进行质量监测：MT-Bench, FAVA, ARES

