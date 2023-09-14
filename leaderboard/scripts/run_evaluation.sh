#!/bin/bash
export CARLA_ROOT=/home/eidos/Workspace/carla
export CARLA_SERVER=${CARLA_ROOT}/CarlaUE4.sh
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:leaderboard
export PYTHONPATH=$PYTHONPATH:leaderboard/team_code
export PYTHONPATH=$PYTHONPATH:scenario_runner

export LEADERBOARD_ROOT=leaderboard
export CHALLENGE_TRACK_CODENAME=SENSORS
export PORT=2000
export TM_PORT=8000
export DEBUG_CHALLENGE=0
export REPETITIONS=1 # multiple evaluation runs
export RESUME=False


# TCP evaluation
export ROUTES=leaderboard/data/evaluation_routes/routes_lav_valid_1_route_town02.xml
export TEAM_AGENT=team_code/tcp_agent.py
export TEAM_CONFIG=/home/eidos/Warehouse/Teledriving/TCP_agent/epoch=59-last.ckpt
export CHECKPOINT_ENDPOINT=results_TCP.json
export SCENARIOS=leaderboard/data/scenarios/all_towns_traffic_scenarios.json
export SAVE_PATH=/home/eidos/Warehouse/Teledriving/TCP_eval_result/results_TCP

# VAE_TCP
export PATH_VAE_MODEL=/home/eidos/Warehouse/Teledriving/model_JSCC_TWC/VAE/vae_act_20230831/vae_model_epoch_10_iter_118460.pth
# export PATH_VAE_MODEL=/home/csi/jsccc/input_model/tcp_carla_brec_1_bkl_1_bpec_200_bact_4096_model_epoch_39_iter_473840.pth
#export PATH_CH_MODEL=/home/eidos/Warehouse/Teledriving/model_JSCC/VAE_CH/yesMI_AWGN_vae_ch_PSNR12/channel_model_epoch_10_iter_118450.pth
# half quantization
#export MODE_PRECISION=quantization 
#export MODE_NOISE=AWGN
export PSNR=12

# JPEG J2K BPG
# export MODEL_TYPE=BPG
export QUALITY=51
# Gym
#export FIFO_PATH=/home/eidos/Workspace/GitKraken_ws/meta_driving/fifo_space

python3 ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator.py \
--scenarios=${SCENARIOS}  \
--routes=${ROUTES} \
--repetitions=${REPETITIONS} \
--track=${CHALLENGE_TRACK_CODENAME} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--debug=${DEBUG_CHALLENGE} \
--record=${RECORD_PATH} \
--resume=${RESUME} \
--port=${PORT} \
--trafficManagerPort=${TM_PORT}


