# MachineLearning
Chance Emanuels Bradley University
9/18/2019

This is a very simplistic nerual network that has four hidden layers with 3 nodes per layer. Neural Networks are only as useful as the data that is provided. The cool stuff happens in OpenAI Gym 

# Packages to import 
    import tensorflow as tf
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt

# Defining # of layers and nodes per layer & number of epochs
    n_inputs = 2 # input vector dimension
    n_nodes_hidden_layer_1 = 3 # number of nodes in hidden layer 1
    n_nodes_hidden_layer_2 = 3 # number of nodes in hidden layer 2
    n_nodes_hidden_layer_3 = 3 # number of nodes in hidden layer 3
    n_nodes_hidden_layer_4 = 3 # number of nodes in hidden layer 4

    n_output_classes = 1 # number of output classes
    numOfepochs = 200

# InputData
    inputData = [[0, 0, 0],
                 [0, 1, 0],
                 [1, 0, 0],
                 [1, 1, 1]]

    inputData = np.array(inputData)

# Setting the shape of the data & placeholder for features, labels hypothesis (output)
    def input_evaluation_set(inputData):
        x = inputData[:, 0:2]
        y = inputData[:, 2:3]
        features = x
        labels = y
        return features, labels


# define placeholder for features, labels hypothesis (output)
    xt = tf.placeholder('float', shape=[4,2])
    y = tf.placeholder('float', shape=[4,1])
    h = tf.placeholder('float', shape=[4,1])

# Define Neural Network Architecture 
def my_neural_network(xt): # creating a neural network
    
    hidden_layer_1 = {'theta1' :tf.Variable(tf.random_normal([n_inputs, n_nodes_hidden_layer_1])),
                      'biases1' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_1]))}
    
    hidden_layer_2 = {'theta2' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_1, n_nodes_hidden_layer_2])),
                      'biases2' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_2]))}
    
    hidden_layer_3 = {'theta3' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_2, n_nodes_hidden_layer_3])),
                      'biases3' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_3]))}
    
    hidden_layer_4 = {'theta4' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_3, n_nodes_hidden_layer_4])),
                      'biases4' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_4]))}
    output_layer = {'theta4' :tf.Variable(tf.random_normal([n_nodes_hidden_layer_4, n_output_classes])),
                    'biases4' :tf.Variable(tf.random_normal([n_output_classes])),}
    
    # thetas are the weights and biases are the threshold
    # repeat mechanics of the hidden layers until hypthosis has gobal minium error
    # feedforward
    z2 = tf.add(tf.matmul(xt, hidden_layer_1['theta1']), hidden_layer_1['biases1'])
    a2 = tf.sigmoid(z2)
    
    z3 = tf.add(tf.matmul(a2, hidden_layer_2['theta2']), hidden_layer_2['biases2'])
    a3 = tf.sigmoid(z2)
    
    z4 = tf.add(tf.matmul(a3, hidden_layer_3['theta3']), hidden_layer_3['biases3'])
    a4 = tf.sigmoid(z2)
    
    z5 = tf.add(tf.matmul(a4, hidden_layer_4['theta4']), hidden_layer_4['biases4'])
    a5 = tf.sigmoid(z2)
    
    z5 = tf.matmul(a5, output_layer['theta4']) + output_layer['biases4']
    h = tf.sigmoid(z5)
    
    return h
    
    h = my_neural_network(xt)
    cost = tf.reduce_mean(((y* tf.log(h)) + ((1-y) * tf.log(1.0-h))) * -1)
    optimizer = tf.train.GradientDescentOptimizer(.01).minimize(cost)

    with tf.Session() as sess:
        sess.run(tf.global_variables_initializer())
        writer = tf.summary.FileWriter("logs", sess.graph)

        for epoch in range(numOfepochs):
            x_,y_ = input_evaluation_set(inputData)
            _, loss = sess.run([optimizer, cost], feed_dict={xt: x_.tolist(), y:y_.tolist()})
            if epoch % 1000 == 0:
                print ('Epoch:', epoch, 'loss=', loss)
                print('hypothesis', sess.run(h, feed_dict={xt: x_.tolist(), y:y_.tolist()}))
                h_final = h > .05

                if (loss <.05):
                    break













