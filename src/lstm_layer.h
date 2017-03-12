#ifndef LSTM_LAYER_H
#define LSTM_LAYER_H

#include "activations.h"
#include "layer.h"
#include "network.h"


layer make_lstm_layer(int batch, int inputs, int hidden, int outputs, int steps, ACTIVATION activation, int batch_normalize, int log);

void forward_lstm_layer(layer l, network_state state);
void backward_lstm_layer(layer l, network_state state);
void update_lstm_layer(layer l, int batch, float learning_rate, float momentum, float decay);

#ifdef GPU
void forward_lstm_layer_gpu(layer l, network_state state);
void backward_lstm_layer_gpu(layer l, network_state state);
void update_lstm_layer_gpu(layer l, int batch, float learning_rate, float momentum, float decay);
void push_lstm_layer(layer l);
void pull_lstm_layer(layer l);
#endif

#endif