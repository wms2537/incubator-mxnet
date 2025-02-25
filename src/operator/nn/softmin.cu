/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/*!
 * Copyright (c) 2017 by Contributors
 * \file softmin.cu
 * \brief GPU Implementation of softmin
 */
#include "./softmax-inl.h"
#include "../tensor/elemwise_unary_op.h"

namespace mxnet {
namespace op {

NNVM_REGISTER_OP(softmin).set_attr<FCompute>("FCompute<gpu>",
                                             SoftmaxRTCCompute{"softmax_fwd", true});

NNVM_REGISTER_OP(_backward_softmin)
    .set_attr<FCompute>("FCompute<gpu>", SoftmaxRTCGradCompute{"op::mul", "softmax_bwd", true});

}  // namespace op
}  // namespace mxnet
