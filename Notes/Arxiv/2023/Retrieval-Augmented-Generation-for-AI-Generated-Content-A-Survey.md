# Retrieval-Augmented Generation for AI-Generated Content: A Survey
2024-05-22
## Introduction
- **Advantage**
	- conceptualized as non-parametric memory
		- easily modifiable
		- accommodating long-tail knowledge
		- encode confidential knowledge
	- reduce generation cost
		- size
		- support for long contexts
		- elinimate certain generation steps 

## Preliminary
- **RAG Process**
	- input query
	- **retriever** locates and looks up the data
	- retrieved results  **enhance** the generation process
	- **generator** generates outputs
![image.png](https://s2.loli.net/2024/05/23/H5N6dvwjxeFROJ8.png)

- **Generator**
	- Transformer Model
	- LSTM
	- diffusion model
	- GAN
- **Retriever**: key-value store. Given a query, the objective is to search for the top-k most similar keys using a **similarity function**, and obtain the paired values.
	- Sparse Retriever: mainly in document searching. analyse word statistics and construct inverted indices. TF-IDF, query likelihood, BM25.
	- Dense Retriever: represent queries and keys using dense **embedding vectors** and ANN index. Similarity score is cosine, inner product or L2.
		- Text: Bert. Dense Passsage Retrieval(DPR)
		- encode code, audio, image, video...
- **Others**
	- use the edit distance between language texts
	- in KG, relations are regarded as pre-built index for searching. K-hop search
	- Named entity recognition(NER): input is query, entites are keys


## Methods
### RAG Foundations
Based on **how** the retriever enhance the generator:
- query-based: merge the query and the retrieved content
- latent representation-based: retrieved objects are incorporated into generative models as latent representations. Do sth in the generator, such as encode the query first and merge the results in the decoing stage.
- Logit-based: integrate retrieval information through logits during the decoding process
- Speculative: use retrieval instead of generation. The retrival can be as small model in spec or the history of the generation, etc. 
![image.png](https://s2.loli.net/2024/05/23/63gDUbQFGeThMHL.png)

### RAG Enhancements
Based on the **target** to enhance:
- **Input**
	- Query Transformation:
		- query->richer document (Query2doc, HyDE)
		- decompose the query into sub-queries (TOC)
	- Data Augmentation: improves data before retrieval 
		- irrelevant information
		- ambiguity
		- outdated docs
- **Retriever**
	- Recursive Retrieval: multi searches (ReACT, RATP)
	- Chunk Optimization: adjusting chunk size (LlamaIndex, RAPTOR)
		- Sentence-Window: fetch small texts, return a window surround relavant texts
		- Automerge: retrieve the parent node, which contains child nodes. 
	- Retriever Finetuning: finetune the embedding model with specific data (REPLUG, APICoder)
	- Hybrid Retrieval: diverse retrieval methodologies or multi data sources, such as using both dense and sparse methods.
	- Re-ranking: reorder the retrieved content (Re2G)
	- Retrieval Transformation: rephrase retrieved content
- **Generator**
	- Prompt Engineering: like CoT
	- Decoding Tuning: finetune the hyperparameters of decoding, such as the temperature, output vocabulary
	- Generator Finetuning
- **Result**
	- Output Rewrite: rewrite outputs in certain scenarios to meet downstream tasks, such as coding, KG
- **RAG Pipeline**
	- Adaptive Retrieval: over-retrieval may lead to resource wastage and potential confusion. To determine the necessity to retrieval:
		- Rule-based: probability in the generation process; model uncertaity, input uncertainty and input to guide the decision; etc
		- Model-based: trained generator to determine; LLMs
	- Iterative RAG: progressively refines results by repeatedly cycling through retrieval and generation phases

![image.png](https://s2.loli.net/2024/05/23/g5H7fr98N4I2JW6.png)

## Applications
temporarily omit...
![image.png](https://s2.loli.net/2024/05/23/VBxYaGbvnkld2Mf.png)

## Discussion
**Limitations**
- Noises in Retrieval Results: irrelevant or misleading information
- Extra overhead: retrieving increase latency
- The Gap between Retrievers and Generators: “Since the objectives of retrievers and generators may not align, and their latent spaces might differ, designing their interaction requires meticulous design and optimization”
- Increased System Complexity
- Lengthy Context: lengthens the context tremendously

**Potential Future Directions**
- Novel Design of Augmentation Methodologies
- Flexible RAG Pipelines: such as recursive, adaptive, iterative... 
- Broader Applications
- Efficient Deployment and Processing: langchain, llama-index, piperag...
- Incorporating Long-tail and Real-time Knowledge: explore the pipeline for knowledge updating and expansion
- Combined with Other Techniques: like finetuning, rl, CoT, agent-based generation

## Some Sentences
- rag advantage
> “The knowledge stored for retrieval can be conceptualized as non-parametric memory, which is easily modifiable, capable of accommodating broad long-tail knowledge, and also able to encode confidential data.” (Zhao 等, 2024, p. 1)

- why this paper?
> Despite the rapid growth in recent research on RAG and the booming applications, a systematic review encompassing all foundations, enhancements, and applications is notably absent, hindering the development of this field.
> This survey offers a comprehensive overview of RAG, covering **foundations, enhancements, applications, benchmarks, limitations, and potential future directions**.