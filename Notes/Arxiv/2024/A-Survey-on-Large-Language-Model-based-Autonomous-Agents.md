2024-05-17
# A Survey on Large Language Model based Autonomous Agents
## Metadata
Lei Wang1, Chen Ma*1, Xueyang Feng*1, Zeyu Zhang1, Hao Yang1, Jingsen Zhang1, Zhi-Yuan Chen1, Jiakai Tang1, Xu Chen(B)1, Yankai Lin(B)1, Wayne Xin Zhao1, Zhewei Wei1, Ji-Rong Wen1 1 
Gaoling School of Artificial Intelligence, Renmin University of China, Beijing, 100872, China
## Summary
construction of agents, their applications, and methods of evaluation

## Introduction
- traditional agents
	- simple and heuristic policy functions
	- isolated and restricted enviroments
- LLM-based agents
	- comprehensive internal world knowledge
	- natural interfaces with humans
> “key idea is to equip LLMs with crucial human capabilities like memory and planning to make them behave like humans and complete various tasks effectively.”

## Construction
**Effectively leverage LLMs:**
- which architecture should be designed to better use LLMs
- give the designed architecture, how to enable the agent to acquire capabilities for accomplishing specific tasks

**Interesting Analogy**
designing the agent architecture <=> determining the network structure
agent capability acquisition <=> learning the network parameters
### Design
> To bridge the gap between traditional LLMs and autonomous agents, a crucial aspect is to design rational agent architectures to assist LLMs in maximizing their capabilities

![image.png](https://s2.loli.net/2024/05/18/BvskeHhIcKUdA2V.png)
> The purpose of the profiling module is to 
> The memory and planning modules place the agent into a dynamic environment, enabling it to recall past behaviors and plan future actions. 
> The action module is responsible for translating the agent’s decisions into specific outputs.

- **Profiling Module:** identify the role of the agent. 
	- handcrafting method: mannual agent profiles
		- flexible
		- labor-intensive
	- LLM-generation Method: LLM generate
		- save labor
		- lack precise control
	- Dataset Alignment Method: obtained from real-world datasets
- **Memory Module:** stores information perceived from the environment and leverages the recorded memories to facilitate future actions
	- Structures: short/long-term memory 
		- Unified Memory: 
			- in-context learning, short-term memory
			- memory information is written in prompts
			- hard to put all memories into prompt
		- Hybrid Memory:
			- prompt(short) and external database(long)
	- Formats: 
		- natural language memory: agent behaviors and observations are directly described using raw natural language
			- flexible and understandable
			- rich semantic information
		- embedding memory: memory information is encoded into embedding vectors
			-  enhance memory retrieval and reading efficiency
		- databases: memory information is stored in databases
			- utilize SQL
			- memory module is based on a database
		- Structured Lists: memory information is organized into lists
			- the semantic of memory can be conveyed efficient and concise 
	- Memory Operations: interaction with enviroments
		- memory reading: extract meaningful information from memory
			- recency, relevance, importance
			- $$m^{*}=\arg \min _{m \in M} \alpha s^{r e c}(q, m)+\beta s^{r e l}(q, m)+\gamma s^{i m p}(m)$$, choose m* as the memory to extract.
		- memory writing:   store information about the perceived environment
			- memory duplicated
				- using LLM to condense the similar sequences
				- aggregate via count accumulation
			- memory overflow: 
				- user delete
				- FIFO
		- memory reflection: summarize into broader and more abstract insights
			- (Generative agents) generate questions based on memory -> query memory to obtain relevavnt infomation -> generate five insights
			- low-level -> high-level

> The memory module can help the agent to accumulate experiences, self-evolve, and behave in a more consistent, reasonable, and effective manner.

> “Human memory follows a general progression from sensory memory that registers perceptual inputs, to short-term memory that maintains information transiently, to longterm memory that consolidates information over extended periods.”

> “integrating both short-term and longterm memories can enhance an agent’s ability for long-range reasoning and accumulation of valuable experiences, which are crucial for accomplishing tasks in complex environments”

> “The memory module plays a critical role in allowing the agent to acquire, accumulate, and utilize significant knowledge by interacting with the environment”


- **Planning Module**: deconstruct into simpler subtasks and solve them independently
	- without feedback
		- Single-path Reasoning: each step leading to only one subsequent step
			- Chain of Thought: proposes inputting reasoning steps for solving complex problems into the prompt
		- Multi-path Reasoning: the reasoning steps organized into a tree-like structure
			- using a tree-like reasoning structure
			- COT-SC, ToT
		- external planners: generate plans for domain-specific problems
	- with feedback
		- environment
			- thought-act-observation (ReAct)
			- intermediate progress of execution, execution error, self-verification (Voyager)
			- environment states and executed action information
		- human
			- make the agent align with the human values and preferences
			- alleviate the hallucination problem
		- model
			- output-feedback-refinement
> “CO-LLM demonstrates that LLMs is good at generating high-level plans, but struggle with low-level control. To address this limitation, a heuristically designed external low-level planner is employed to effectively execute actions based on high-level plans.

- **Action Module**: interacts with the environment
	- Action goal
		- Task completion: to complete specific task
		- Communication: to communicate with agents or humans
		- Environment exploration: to explore unfamiliar environments to expand its perception
	- Action production
		- Action via Memory Recollection: generated by memory and task
		- Action via Plan Following: pre-generated plans
			- generate action plans first
			- decomposing the task into sub-goals and make plans.

	- Action space: the set of possible actions
		- external tools: call external tools for executing action
			- APIs: existing APIs, API invoked by LLM
			- Databases & knowledge Bases
			- External Models: incorporates other models 
		- inernal knowledge of LLMs
			- capabilities of LLMs: plan, conversation, understanding
	- Action impact
		- Change environment
		- Alter internal states

### Agent Capability Acquisition
> The architecture functions as the “hardware” of the agent. 
> The agent may lack the necessary **task-specific capabilities**, skills and experiences, which can be regarded as "software" resources.

- Capability Acquisition with Fine-tuning
	- Human Annotated Datasets: align with humans, costly
	- LLM Generated Datasets: cheap
	- Real-world Datasets
- Capability Acquisition without Fine-tuning
	- Prompt engineering
		- CoT-like
		- agent beliefs about mental states
		- inject reflections
	- Mechanism Engineering
		- Trial-and-error: action-judge-error-incorporate feedbacks
		- Crowd-sourcing: multi agents learn from each other's idea to reach consensus
		- Experience Accumulation: extract past memory to solve similar task
		- Self-driven Evolution

>In the era of agents, the model capability can be acquired based on three strategies:(1) model fine-tuning, (2) prompt engineer and (3) designing proper agent evolution mechanisms

![image.png](https://s2.loli.net/2024/05/18/eGopk93StVDi8IZ.png)
## Application
- social science
	- psychology: different profiles
	- political science and economy: predict voting, political speech, economic behavior
	- social simulation
	- jurisprudence
	- research assistant
- natural science
	- documentation and data management
	- experiment assistant
	- education
- engineering
	- civil engineering: design
	- cs & se: code
	- industrial automation: control of procedure
	- robotics & embodied: plan, reason, collaborate
- libraries to easily implement/evaluate:
	- LangChain: automates coding, testing, debugging and documentation
	- XLang, AutoGPT...

## Evaluation
- subjective evaluation
	- human annotation: human score or rank
	- Turing Test: separate the outputs by humans and agents
	- use of LLMs
- objective evaluation
	- metrics
		- Task success metrics
		- Human similarity metrics
		- Efficiency metrics
			- length of planning
			- cost associated with devolopment
			- speed of inference
			- number of clarification dialogue
	- Protocols: how to leverage these metrics to evaluate the capability
		- Real-world simulation: in real environments
		- Social evaluation: assess social intelligence based on agent interaction
		- Multi-task evaluation: generalization capability
		- Software testing
	- Benchmarks
![image.png](https://s2.loli.net/2024/05/18/KV9oYa81DtyFgCS.png)

## Challenges
- role-playing capability
	- fine-tuning
	- design tailored agent prompts/architecture

> “In addition, previous research [30] has shown that existing LLMs may not well model the human cognitive psychology characters, leading to the lack of self-awareness in conversation scenarios” (Wang 等, 2024, p. 32)

- Generalized Human Alignment
> when the agents are leveraged for real-world simulation, an ideal simulator should be able to honestly depict diverse human traits, including the ones with incorrect values.

- Prompt Robustness
> agents, as they encompass not a single prompt but a prompt framework that considers all modules, wherein the prompt for one module has the potential to influence others.

- Hallucination
	- incorporating human correction feedback
- Knowledge Boundary
	- how to simulate diverse real-world human behaviors?
	- constrain the utilization of user-unknown knowledge of LLM
> LLMs may make decisions based on their extensive knowledge, even though real-world users would not have access to the contents

- Efficiency
	- inference
	- extract memory
	- make plans before taking actions
	- ...
