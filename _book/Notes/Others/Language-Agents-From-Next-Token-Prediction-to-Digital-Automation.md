# Language Agents: From Next-Token Prediction to Digital Automation
2024-05-17
## Summary


## Taxonomy
- existing agent:
	- rule-based agent: **design** on domain-specific rule
	- learning-based agent:  **train** on domain-specific data
	- with humans or the physical world
- language agent: 
	- **reason** to act
	- with digital enviroments
- 

## Introduction
### Traditional Agents
**Challenge:**
> major decisions in life are often semantic and open-ended
- action space challenge

> “these rule or learning-based agents do not possess language knowledge beyond the game(s) they are designed for or trained on, which poses the second key challenge of generalization to novel games or domains.”
- key challenge of generalization
> How can we inject such language and world priors into text game agents?

- Contextual Action Language Models (CALM)
	- finetune on human gameplay trajectories
	- game-specific reinforcement learning
	- not understand, but memorize (hashing)

> “the space of thought is infinite (anything can be thought of), so strong language priors are needed to effectively reason.”

- small, closed, synthetic situations: **easy to overfit** using rule-based or RL
- slow, expensive, noisy

**scalable, open-ended, practical**
### Outline
scalable **benchmarks** to construct problems
motivate new **methodology** to solve problems
Combine to form a **framework**
## Benchmark
> A general-purpose autonomous agent should tackle the following key challenges: (1) reasoning over complex textual, visual, and other multimodal observations, (2) decision-making over open-ended actions, and (3) exploration over long horizon

**Why benchmark**
- Existing benchmark: “small action spaces, synthetic text (or pixels), and short-horizon tasks”
- To build language agent, first build benchmarks

**Why Web？**
- language elements that reflect rich, real-world usage and are collectible at scale
- task feedback that is well-defined and automatically computable to facilitate interactive learning


query the search engine
choose items
open and read the details
select necessary options
but








Keep calm and explore: Language models for action generation in text-based games.