# video-piracy-detection
Video piracy is a form of online digital piracy and includes the unauthorized online distribution of video copies of copyrighted material such as movies etc..,
Piracy is an important issue as far as the manufacturers are concerned as it can result in a huge revenue loss.
The reason behind the practice of full- scale piracy is mainly due to the difficulty involved in tracking the source responsible for the piracy.
The goal of this project is to detect video piracy.
We will take few videos as input.These videos includes high quality as well as low quality videos.
Extract frames and audio samples from those videos.
We calculate NIQE (Naturalness Image Quality Evaluator), BRISQUE (Blind/Referenceless Image Spatial Quality Evaluator) and PIQE(perception based image quality measure) of the videos.These three are no-reference image quality measures.
We even extract audio samples from the video.
We use these measures to train “SVM” and “NAIVE BAYES”.Now SVM model and Bayes model is ready.
We send a video which is to be tested.SVM model and Bayes model predicts whether the video is pirated or not.
