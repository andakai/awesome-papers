# The Landscape of Emerging AI Agent Architectures for Reasoning, Planning, and Tool Calling: A Survey
2024-05-16
## Basic Concept
- Agent：由大模型驱动的，可以在多轮迭代中执行任务的实体。
- Agent Persona：Agent的角色或性格，还包括agent能够使用的工具的描述
- Tools：Agent能够调用的任何函数。可以和外界的数据进行交互
- Single Agent Architecture：单个Agent的系统
- Multi-Agent Architectures：多Agent系统

## Key Consideration for Agent
- Reasoning
	- 在Plan or act之前，需要经过Reasoning，否则只能基于对请求的简单理解，或存在对请求的误解。
- Planning
	- 在有强大推理能力的基础上进行。
	- task decomposition
	- multi-plan selection：从多个生成的选项中选择一个
	- external module-aided planning：利用外部已经存在的计划
	- reflection and refinement：根据新的信息进行反思，修订之前的计划
	- memory-augmented planning：利用额外的数据、信息
- Tool calling
	- 区别于普通的prompt-base的模型的点，即可以call tools
	- 外部的数据源、利用已有的API

## Single Agent
> “We find that single agent architectures are especially useful when the task requires straightforward function calling and does not need feedback from another agent” 

- ReAct：
	- Reason + Act
	- 对给定的任务做Reason，得到一个想法，再根据这个想法Act
- RAISE：
	- ReAct + 记忆机制
	- 引入长短记忆数据库。在长对话中能保持能力
	- 缺点：没有强大的逻辑，角色容易混乱
- Reflexion：
	- sefl-reflection
	- 利用LLM evaluator来实时为agent做出反馈
	- 减少了幻觉的产生
- AutoGPT+ P：
	- object detection + Object Affordance Mapping
	- 在一个场景下检测现在的对象，LLM根据对象判断使用的Tool：Plan, Partial Plan, Suggest Alternative, Explore。
	- LLM本身不生产Plan，而只生成目标，让classical planner生成Plan。原因：认为LLM的推理能力不足。
	- 缺点：工具选择不准确导致卡住；exploration阶段不合理的工具选择；执行时无法与人交互
- LATS：
	- Language Agent Tree Search
	- 引入self-reflection手段：在执行了一个操作后，根据反馈判断是否在推理时出现问题，并尝试提出新方法。
	- 缺点：算法复杂性高

## Multi Agent
> “Multi-agent architectures create an opportunity for both the intelligent division of labor based on skill and helpfu feedback from a variety of agent personas.”

clear leadership
dynamic team construction
effective information sharing between team members
- Embodied LLM Agents Learn to Cooperate in Organized Teams：
	- multi-agent中有一个organized leader时效果比没有leader好
	- criticize-reflect：生成计划、评判效果、给出反馈、进行组织调整(dynamic team structure)
- DyLAN：
	- 判断每个Agent在上一轮中的贡献，在下一轮中只使用最高贡献的几个Agent
	- dynamic team的应用
- AgentVerse：
	- recruiment：动态地添加、移除Agent
	- collaborative decision making
	- independent action execution
	- evaluation
	- 发现了：horizontal结构适合collaborative tasks，而vertical结构适合在call tools时独立性好的任务。
- MetaGPT：
	- 通过让agent生成结构化的输出，比如文件、图表，而不是分享非结构化的语言，解决了agents之间的没有用的对话的问题
	- 发布-订阅者模式：解决信息分享的问题。避免了agents之间不必要的交流

## Findings
- Agent的工作流：plan -> act -> evaluate
- 通用的优化方式：
	- 清晰的反馈
	- 任务分解
	- 迭代改进
	- 定义角色
- Single vs Multi
	- 应用场景
	- 执行任务时的效率
- 反馈的重要性
- Multi时的组织层次：horizontal vs vertical
- 角色定义和动态的组织调整

## Limitations of Current research
- agent evaluation
- 好的benchmark的重要性
- 现实应用的benchmark
- Agent system中的偏见与危害




