import tensorflow as tf
from tensorflow.python.framework import ops
import numpy as np

# Define custom py_func which takes also a grad op as argument:
def py_func(func, inp, Tout, stateful=True, name=None, grad=None):
    
    # Need to generate a unique name to avoid duplicates:
    rnd_name = 'PyFuncGrad' + str(np.random.randint(0, 1E+8))
    
    tf.RegisterGradient(rnd_name)(grad)  # see _MySquareGrad for grad example
    g = tf.get_default_graph()
    with g.gradient_override_map({"PyFunc": rnd_name}):
        return tf.py_func(func, inp, Tout, stateful=stateful, name=name)


# Def custom square function using np.square instead of tf.square:
def reduce_precision(x, precision_bits=32, name=None):
    global Nprec
    global redprec_x
    Nprec = 2**precision_bits
    
    with ops.op_scope([x], name, "reduce_precision") as name:
        redprec_x = py_func(np.floor,
                        [x*Nprec],
                        [tf.float32],
                        name=name,
                        grad=_reduce_precisionGrad)  # <-- here's the call to the gradient
        return redprec_x[0] / Nprec

# Actual gradient:
def _reduce_precisionGrad(op, grad):
    global Nprec
    x = op.inputs[0]
    r = tf.mod(x,1)
    n_gr = tf.to_float(tf.less_equal(r, 0.5))
    return n_gr*grad #grad * 20 * x  # add a "small" error just to see the difference:

with tf.Session() as sess:
    x = tf.constant([0,0.12, 0.5, 0.85,1])
    y = reduce_precision(x,8)
    tf.initialize_all_variables().run()

    print(x.eval(), y.eval(), tf.gradients(y, x)[0].eval())
