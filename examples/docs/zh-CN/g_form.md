## Form 表单
表单输入框用于输入、提交数据。在输入框中单击鼠标会出现插入点光标，我们可以直接在输入框中输入文字或文本信息。  
应用场景：用于收集信息，需要对输入的数据类型进行校验时。  
交互方式：鼠标滑过输入框高亮显示，单击出现光标，可以开始输入文本内容。

### 类型一
基础输入框
<el-row :gutter="30">
  <el-col :span="12">
  <span class="demo-stration">默认状态（未输入） </span>
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型一-默认状态（未输入）.png" alt="表单-类型一-默认状态（未输入）">
  </el-col>
  <el-col :span="12">
  默认状态（已输入）  
  <br/><img class="demo-img" src="../../assets/images/form/默认状态（已输入）.png" alt="默认状态（已输入）">
  </el-col>
</el-row>
<el-row :gutter="30">
  <el-col :span="12">
  悬浮状态
  <br/><img class="demo-img" src="../../assets/images/form/悬浮状态.png" alt="悬浮状态">
  </el-col>
  <el-col :span="12">
  输入状态
  <br/><img class="demo-img" src="../../assets/images/form/输入状态.png" alt="输入状态">
  </el-col>
</el-row>
<el-row :gutter="30">
  <el-col :span="12">
  只读状态
  <br/><img class="demo-img" src="../../assets/images/form/只读状态.png" alt="只读状态">
  </el-col>
  <el-col :span="12">
  报错状态
  <br/><img class="demo-img" src="../../assets/images/form/报错状态.png" alt="报错状态">
  </el-col>
</el-row>

### 类型二

带有单位的输入框

#### 单位支持下拉选择

<el-row :gutter="30">
  <el-col :span="12">
  默认状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-默认状态.png" alt="表单-类型二-默认状态">
  </el-col>
  <el-col :span="12">
  悬浮状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-悬浮状态.png" alt="表单-类型二-悬浮状态">
  </el-col>
</el-row>
<el-row :gutter="30">
  <el-col :span="12">
  下拉禁用状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-下拉禁用状态.png" alt="表单-类型二-下拉禁用状态">
  </el-col>
  <el-col :span="12">
  输入状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-输入状态.png" alt="表单-类型二-输入状态">
  </el-col>
</el-row>
<el-row :gutter="30">
  <el-col :span="12">
  悬浮状态-下拉
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-悬浮状态-下拉.png" alt="表单-类型二-悬浮状态-下拉">
  </el-col>
</el-row>


#### 单位只读

<el-row :gutter="30">
  <el-col :span="12">
  默认状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-默认状态2.png" alt="表单-类型二-默认状态2">
  </el-col>
  <el-col :span="12">
  悬浮状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-悬浮状态2.png" alt="表单-类型二-悬浮状态2">
  </el-col>
</el-row>
<el-row :gutter="30">
  <el-col :span="12">
  输入状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-输入状态2.png" alt="表单-类型二-输入状态2">
  </el-col>
  <el-col :span="12">
  输入完成状态（显示格式仅针对金额）
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-输入完成状态（显示格式仅针对金额）.png" alt="表单-类型二-输入完成状态（显示格式仅针对金额）">
  </el-col>
</el-row>
<el-row :gutter="30">
  <el-col :span="12">
  禁用状态
  <br/><img class="demo-img" src="../../assets/images/form/表单-类型二-只读状态.png" alt="表单-类型二-只读状态">
  </el-col>
</el-row>