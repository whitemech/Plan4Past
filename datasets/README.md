# Datasets

The datasets used for the experiments in [Bonassi et al. 2023] to test Plan4Past.

## Structure

- `BF/`: The set of instances with Temporally Extended Goals defined in [Bonassi et al. 2023]
- `TB/`: The set of instances with Temporally Extended Goals used in [Torres and Baier 2015]

## How to use Plan4Past

In every domain folder there is a dictionary named "DOMAIN-NAME_teg.json" 
containing the PPLTL temporally extended goals for the instances.
Note that in the paper all formulas are written in NNF (Negation Normal 
Form) as they are clearer to read and understand.

In the rovers domain an additional mapping file is required. The purpose 
of this file is to create a mapping between the atoms in the formula and 
the atoms in the pddl domain. For problem "pXX.pddl" of rovers, a mapping 
file "pXX.map" is provided.

### Examples

Launch the following commands from the main Plan4Past folder

#### Example 1

To run the compiler for the "s2-0.pddl" instance of the elevator domain: 

```bash
plan4past -d datasets/deterministic/BF/elevators_ppltl/domain.pddl -p datasets/deterministic/BF/elevators_ppltl/s2-0.pddl -g 'O(served_p1) & O(served_p0 & !(Y(O(served_p1))))'
```

where the PPLTL formula `O(served_p1) & O(served_p0 & !(Y(O(served_p1))))` is 
mapped to the key `s2-0` in the `BF/elevators_ppltl/elevators_teg.json` dictionary.

#### Example 2 

To run the compiler for the "p01.pddl" instance of the rovers domain:

```bash
plan4past -d datasets/deterministic/BF/rovers_ppltl/domain.pddl -p datasets/deterministic/BF/rovers_ppltl/p01.pddl -g 'FORMULA' --map datasets/deterministic/BF/rovers_ppltl/p01.map
```

where `'FORMULA'` is:

```
'O(communicated_soil_data-waypoint2 & !Y(O(communicated_rock_data-waypoint3))) & O(communicated_rock_data-waypoint3 & !Y(O(communicated_image_data-objective1-high_res))) & O(communicated_image_data-objective1-high_res) & !(!(((!at-rover0-waypoint0) S calibrated-camera0-rover0)) & O(at-rover0-waypoint0))'
```

and it is mapped to the key `p01` in the `BF/rovers_ppltl/rovers_teg.json` dictionary.
