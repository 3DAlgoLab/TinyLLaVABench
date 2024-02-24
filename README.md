<h2 align="center"> <a href="https://arxiv.org/abs/2402.14289">TinyLLaVA: A Framework of Small-scale Large Multimodal Models</a>

<h5 align="center">

[![hf_space](https://img.shields.io/badge/🤗-%20Open%20In%20HF-blue.svg)](https://huggingface.co/bczhou/TinyLLaVA-3.1B) [![arXiv](https://img.shields.io/badge/Arxiv-2402.14289-b31b1b.svg?logo=arXiv)](https://arxiv.org/abs/2402.14289) [![License](https://img.shields.io/badge/License-Apache%202.0-yellow)](https://github.com/PKU-YuanGroup/MoE-LLaVA/blob/main/LICENSE) 


## &#x1F389; News
* **[2024.02.24]**  Example code on inference and model loading added!
* **[2024.02.23]**  Evaluation and Training code and scripts released!
* **[2024.02.21]**  Creating the [TinyLLaVABench](https://github.com/DLCV-BUAA/TinyLLavaBench) repository on GitHub!
* **[2024.02.21]**  Our paper: [TinyLLaVA: A Framework of Small-scale Large Multimodal Models](https://arxiv.org/abs/2402.14289) is out!
* **[2024.01.11]**  Our fist model [TinyLLaVA-1.4B](https://huggingface.co/bczhou/tiny-llava-v1-hf) is out!

## &#x231B; TODO
- [ ] Colab examples and demo.
- [x] Release code for training.
- [ ] Add descriptions for evalaution.
- [ ] Add descriptions for data preparation.
- [ ] Release TinyLLaVA-1.5B and TinyLLaVA-2.0B.
- [x] Release TinyLLaVA-3.1B.
- [x] Release the evaluation code and weights today(2024.2.23).
### &#x1F525; High performance, but with fewer parameters

- Our best model, TinyLLaVA-3.1B, achieves better overall performance against existing 7B models such as LLaVA-1.5 and Qwen-VL.

## &#x1F433; Model Zoo
### Legacy Model
> https://huggingface.co/bczhou/tiny-llava-v1-hf

### Pretrain Model
- [TinyLLaVA-3.1B](https://huggingface.co/bczhou/TinyLLaVA-3.1B)


## &#x1F527; Requirements and Installation

We recommend the requirements as follows.

1. Clone this repository and navigate to LLaVA folder
```bash
git clone https://github.com/DLCV-BUAA/TinyLLaVABench.git
cd TinyLLaVABench
```

2. Install Package
```Shell
conda create -n tinyllava python=3.10 -y
conda activate tinyllava
pip install --upgrade pip  # enable PEP 660 support
pip install -e .
```

3. Install additional packages for training cases
```Shell
pip install -e ".[train]"
pip install flash-attn --no-build-isolation
```


## &#x1F527; Quick Start

<details>
<summary>Load model</summary>
    
```Python
from tinyllava.model.builder import load_pretrained_model
from tinyllava.mm_utils import get_model_name_from_path
from tinyllava.eval.run_tiny_llava import eval_model

model_path = "bczhou/TinyLLaVA-3.1B"

tokenizer, model, image_processor, context_len = load_pretrained_model(
    model_path=model_path,
    model_base=None,
    model_name=get_model_name_from_path(model_path)
)
```
</details>

## &#x1F527; Run Inference
<details>
<summary>Run Inference</summary>
    
```Python
from tinyllava.model.builder import load_pretrained_model
from tinyllava.mm_utils import get_model_name_from_path
from tinyllava.eval.run_tiny_llava import eval_model

model_path = "bczhou/TinyLLaVA-3.1B"
prompt = "What are the things I should be cautious about when I visit here?"
image_file = "https://llava-vl.github.io/static/images/view.jpg"

args = type('Args', (), {
    "model_path": model_path,
    "model_base": None,
    "model_name": get_model_name_from_path(model_path),
    "query": prompt,
    "conv_mode": "phi",
    "image_file": image_file,
    "sep": ",",
    "temperature": 0,
    "top_p": None,
    "num_beams": 1,
    "max_new_tokens": 512
})()

eval_model(args)
```
</details>

## &#x270F; Citation

If you find our paper and code useful in your research, please consider giving a star :star: and citation :pencil:.

```BibTeX
@misc{zhou2024tinyllava,
      title={TinyLLaVA: A Framework of Small-scale Large Multimodal Models}, 
      author={Baichuan Zhou and Ying Hu and Xi Weng and Junlong Jia and Jie Luo and Xien Liu and Ji Wu and Lei Huang},
      year={2024},
      eprint={2402.14289},
      archivePrefix={arXiv},
      primaryClass={cs.LG}
}
```


## ❤️ Community efforts
* Our codebase is built upon the [LLaVA](https://github.com/haotian-liu/LLaVA) project. Great work!
* Our project uses data from the [ShareGPT4V](https://github.com/InternLM/InternLM-XComposer/tree/main/projects/ShareGPT4V) project. Great work!

